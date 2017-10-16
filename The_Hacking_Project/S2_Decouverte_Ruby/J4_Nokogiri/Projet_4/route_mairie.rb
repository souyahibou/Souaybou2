 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'
 require 'pry'


def get_the_email_of_a_townhal_from_its_webpage(url_city)
  page = Nokogiri::HTML(open(url_city))
  mail_city =  page.css('p:contains("@")')                                                #mail_city = page.css('tbody tr td.style27 p.Style22')                 # html body table tbody tr td table tbody tr td table tbody tr td table tbody tr td.style27 p.Style22 font
  return mail_city.text
end


def get_all_the_urls_of_val_doise_townhalls()
  mairies = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  name_cities =  mairies.css('p a.lientxt')
  i = 0  ; city_data = {:"nom" => "hgh","url": "eh oui","email": ""} ;data_of_cities = []                                        #puts name_city;   puts name_city.class;   puts name_city.count

  name_cities.each do |city|
      if city.class == Nokogiri::XML::Element  then             #unitile
        url_city2 = "http://annuaire-des-mairies.com/" + city['href']
        mail_city = get_the_email_of_a_townhal_from_its_webpage(url_city2)

        city_data[:"nom"] = city.text;  city_data[:"url"] = url_city2;  city_data[:"email"] = mail_city;
        puts city_data[:"nom"] + "\t" + city_data[:"url"] + "\t" + city_data[:"email"]                                             #puts city.content==puts city.text

        data_of_cities[i] = city_data;
        i+=1;
      end
  end
   return data_of_cities
end




array_of_cities_data = get_all_the_urls_of_val_doise_townhalls()
puts array_of_cities_data.count
