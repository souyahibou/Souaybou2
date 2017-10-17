require "google_drive"
require 'pry'
require 'json'
require 'csv'



#récupère l'adresse mail à partir d'une url
def get_the_email_of_a_townhal_from_its_webpage(url_city)
  page = Nokogiri::HTML(open(url_city))
  mail_city =  page.css('p:contains("@")')
  return mail_city.text
end


#récupère toutes les adresses mails a partir des url
def get_all_the_urls_of_val_doise_townhalls()
  mairies = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  name_cities =  mairies.css('p a.lientxt')
  data_of_cities = []

  name_cities.each do |city|
      if city.class == Nokogiri::XML::Element              #unitile
        url_city2 = "http://annuaire-des-mairies.com/" + city['href']
        mail_city = get_the_email_of_a_townhal_from_its_webpage(url_city2)
        data_of_cities << {:nom => city.text, :url => url_city2, :email => mail_city};
        # binding.pry
      end
  end
  return data_of_cities
end



#sauvegarde dans google drive
def save_from_on_GoogleDrive(table_data)
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("1WjvR_A2QIgmf9bB7V2FNGdsWWbm4iSApmgVdqjPby7Q").worksheets[0]   #cle a changer en fonction du lien url du fichier google drive
     for i in 1..table_data.length
       ws[i, 1] = table_data[i-1][:nom]
       ws[i, 2] = table_data[i-1][:url]
       ws[i, 3] = table_data[i-1][:email]
     end
    ws.save
    ws.reload
end



#sauvegarde dans le fichier json
def save_data_in_json_file(table_data)

    Dir::mkdir("here", 0777)            unless File.exist?('here/')
    File::new("here/temp.json", "w+")   unless File.exist?('here/temp.json')
    File.open("here/temp.json","w") do |f|
      f.write(table_data.to_json)
      # f.write(JSON.pretty_generate(tempHash))
    end
end



#sauvegarde dans le fichier csv
def save_data_in_CSV_file(table_data)
    CSV.open("file.csv", "wb") do |csv|
      for i in 1..table_data.length
        csv << [ table_data[i-1][:nom], table_data[i-1][:url], table_data[i-1][:email] ]
      end
    end
end




#éxécution du code principal
def perform
     array_of_cities_data = get_all_the_urls_of_val_doise_townhalls()
     puts array_of_cities_data
     save_from_on_GoogleDrive(array_of_cities_data)
     save_data_in_json_file(array_of_cities_data)
     save_data_in_CSV_file(array_of_cities_data)
end

# appelle de la procédure

perform
