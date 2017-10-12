 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(url_city)
  page = Nokogiri::HTML(open(url_city))
  mail_city =  page.css('p:contains("@")')                                                #mail_city = page.css('tbody tr td.style27 p.Style22')                 # html body table tbody tr td table tbody tr td table tbody tr td table tbody tr td.style27 p.Style22 font
  puts mail_city.text
  return mail_city.text
end


def get_all_the_urls_of_val_doise_townhalls()
  mairies = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  name_cities =  mairies.css('p a.lientxt')                                               #puts name_city;   puts name_city.class;   puts name_city.count
  name_cities.each do |city|
      if city.class == Nokogiri::XML::Element               #unitile
        url_city2 = "http://annuaire-des-mairies.com/" + city['href']
        mail_city = get_the_email_of_a_townhal_from_its_webpage(url_city2)
        puts url_city2 + "\t" + city.text + "\t" +  mail_city                                                                  #puts city.content==puts city.text
      end
  end
end



get_all_the_urls_of_val_doise_townhalls()
