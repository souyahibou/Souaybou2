#Découvre comment lire un fichier JSON avec ce tutoriel sympathique

#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'

json = File.read('input.json')
obj = JSON.parse(json)

pp obj
