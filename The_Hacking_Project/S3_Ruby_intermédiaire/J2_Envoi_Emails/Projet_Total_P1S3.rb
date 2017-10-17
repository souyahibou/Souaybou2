require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'gmail'



#récupère l'adresse mail à partir d'une url
def get_the_email_of_a_townhal_from_its_webpage(url_city)
    page = Nokogiri::HTML(open(url_city))
    mail_city =  page.css('html tr td:contains("@")')
    return mail_city.text
end



def get_all_the_urls_of_val_doise_townhalls()
    url_city = []
    data_of_cities = []
    url_city[0] = 'http://annuaire-des-mairies.com/aube.html'
    url_city[1] = 'http://annuaire-des-mairies.com/aube-2.html'

    for i in 0..1
          mairies = Nokogiri::HTML(open(url_city[i]))
          name_cities =  mairies.css('p a.lientxt')

          name_cities.each do |city|
              if city.class == Nokogiri::XML::Element              #unitile
                  url_city2 = "http://annuaire-des-mairies.com/" + city['href']
                  mail_city = get_the_email_of_a_townhal_from_its_webpage(url_city2)
                  data_of_cities << {:nom => city.text, :url => url_city2, :email => mail_city};
                  # binding.pry
              end
          end
     end
     return data_of_cities
end


#sauvegarde dans google drive
def save_from_on_GoogleDrive(table_data)
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("15qS0KtK9u_33jBD5SuPEItf_hTKf9aDMSDm9cRKeY8I").worksheets[0]   #cle a changer en fonction du lien url du fichier google drive
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




#chargée de l'envoi de mails à a chaque destinataire avec un message personnalisé""
def Operation_on_gmail(mails)                   #<---- attention ici mails est un tab de dimension 2 =(nb_ville x 3 valeurs)
      Gmail.connect('sybknt@gmail.com', 'googledrive') do |gmail|
            puts gmail.logged_in?
            mails.each do |mail|
                townhall_name = mail[0]         #<---- attention ici mail est un tab de 3 valeur
                mail = mail[2].chomp
                if mail.length > 5
                    puts mail
                    email = gmail.compose do
                        to mail
                        content_type 'text/html; charset=UTF-8'
                        subject "What is the Hacking Project!"
                        body "<h3 style='text-align:center'>Chère madame cher Monsieur</h3>
                        <p>Bonjour,
                        Je m'appelle <strong>Souyahibou</strong> , je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle <mark><font color=#8A0886>T</font>he <font color='green'>H</font>acking <font color='purple'>P</font>roject</mark> (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de <strong> <em>The Hacking Project</em></strong>  un nouveau format d'éducation gratuite.<br>
                        Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à {townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de <font color='blue'>moussaillons.</font> (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec <font color='brown'>#{townhall_name}</font> !<br>

                        Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80<p>"
                        #add_file  'Projet_mardi_envoi_emails2.rb'
                    end
                     email.deliver!
                end
            end
        end
end


#récupère les données depuis les spreadsheet dans le GoogleDrive
def download_data_mail
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("15qS0KtK9u_33jBD5SuPEItf_hTKf9aDMSDm9cRKeY8I").worksheets[0]   #cle a changer en fonction du lien url du fichier google drive
    table_of_mails=[]
    table_of_mails=ws.rows                      #<---- /!\ ici ws.rows represente une ligne de tableau et non une valeur d'une cellule
    ws.save
    ws.reload
    return table_of_mails
end



#Réalisation du code à éxécuter(appel de toute les fonctions construites)
def perform

    puts ("Voulez-vous enregistrer vos lites d\'amail de ville dans :")
    puts ("1:GoogleDrive  \n2:Fichier .JSON \n3:fichier CSV" )
    chx = gets
    chx.to_s
    chx = chx.chomp
    if chx = '1' || chx = '2' || chx = '3'
        array_of_cities_data = get_all_the_urls_of_val_doise_townhalls()
        save_from_on_GoogleDrive(array_of_cities_data)
        save_data_in_json_file(array_of_cities_data)
        save_data_in_CSV_file(array_of_cities_data)
    end

    puts ("Voulez-vous envoyer des email promo a vôtre lites d\'amails de ville ?")
    puts ("1:oui  \n2:à moi-même .JSON \nreste:non" )
    chx = gets
    chx.to_s
    chx = chx.chomp
    if chx = '1' || chx = '2' || chx = "gds"
        #Operation_on_gmail(download_data_mail)  déjà utiliser à utiliser avec parcimonie
        Operation_on_gmail([['moi','','syb.k@live.fr'],['moi2','','souaybou.k@live.fr'],['moi3','','sybknt@gmail.com']])   #for test 1arg for name_of_townhall 2arg inutile 3arg le mail
    end

    puts array_of_cities_data

end


 # fichier synthèse total

# appel de la procédure principale d'éxécution du code
perform
