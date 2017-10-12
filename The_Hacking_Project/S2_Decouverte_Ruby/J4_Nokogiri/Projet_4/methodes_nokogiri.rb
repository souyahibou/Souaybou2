page = Nokogiri::HTML(open("index.html"))
puts page.class # => Nokogiri::HTML::Document

 require 'rubygems'
 require 'nokogiri'
 require 'restclient'
 page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/")) 
 puts page.class # => Nokogiri::HTML::Document
