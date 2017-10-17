require 'watir'
require 'pry'

browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'

search_bar = browser.text_field(class: 'gsfi')     #selectionne la barre de recherche  ou utiliser l'inspecteru d'élément pour sélectionner d'autre éléments search_bar = browser.text_field(name: 'p') search_bar = browser.text_field(id: 'lst-ib')
search_bar.set("Hello World!")

search_bar.send_keys(:enter)
=begin
submit_button = browser.button(type:"submit")   #or
submit_button.click
=end
browser.driver.manage.timeouts.implicit_wait = 3
search_result_divs = browser.divs(class:"rc")

search_result_divs.each { |div| p div.h3.text }

p "Méfait accompli, fermeture du browser"
browser.close
