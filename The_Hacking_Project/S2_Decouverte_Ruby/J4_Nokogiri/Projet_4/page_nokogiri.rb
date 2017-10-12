 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'


#Vrai exo

def get_the_email_of_a_townhal_from_its_webpage(url_city)
  page = Nokogiri::HTML(open(url_city))
  mail_city = page.css('p')                       #mail_city = page.css('p:contains("@")')
  puts mail_city.text
  puts mail_city.class
  puts mail_city.count
  puts mail_city

end


def get_all_the_urls_of_val_doise_townhalls

end

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")
