#1
page = Nokogiri::HTML(open("index.html"))
puts page.class # => Nokogiri::HTML::Document


#2
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://en.wikipedia.org/"))
puts page.class # => Nokogiri::HTML::Document



#3
 require 'rubygems'
 require 'nokogiri'
 require 'restclient'
 page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/"))
 puts page.class # => Nokogiri::HTML::Document


 #  page = Nokogiri::HTML(open("http://en.wikipedia.org/"))
 #  puts page.class # => Nokogiri::HTML::Document
 #  puts page.css('title')
 #  puts page.css('title').text
 #  puts page.css('title').count
 #  puts page.css("title")[0].name
 # # puts page.css('li')
 # # puts page.css('li')[0].text
 # # puts page.css('li')[1]['href']
 # puts page.css('div#reference a')
 # puts page.css('href')
 #
 #
 #
 # puts "\n"#Sélection d'un élément    [Nokogiri :: XML :: Element]
 # page = Nokogiri::HTML(open("http://en.wikipedia.org/"))
 # links = page.css("a")
 #
 # puts "\n" #Obtenir un attribut d'un élément
 # links = page.css("a")
 # puts links.length
 # puts links[3].text
 # puts links[3]["href"]
 #
 #
 #  puts "\n"
 #  news_links = page.css("a").select{|link| link['href']}
 #  news_links.each{|link| puts link['href'] }
 #  puts news_links.class
 #  puts news_links.count
 #
 # puts "\n"
 # news_links = page.css("div#references p a")
 # news_links.each{|link| puts "#{link.text}\t#{link['href']}"}
 # puts news_links.class
 # puts news_links.count


 # Objectif 	CSS 3 	XPath
 # Tous les éléments 	* 	// *
 # Tous les éléments P 	p 	// p
 # Tous les éléments de l'enfant 	p> * 	// p / *
 # Element par ID 	#foo 	// * [@ id = 'foo']
 # Élément par classe 	.foo 	// * [contient (@ class, 'foo')] 1
 # Élément avec attribut 	*[Titre] 	//*[@Titre]
 # Premier enfant de tous les P 	p> *: premier enfant 	// p / * [0]
 # Tout P avec un enfant A 	Pas possible 	//Pennsylvanie]
 # Élément suivant 	p + * 	// p / suite-fratrie :: * [0]
