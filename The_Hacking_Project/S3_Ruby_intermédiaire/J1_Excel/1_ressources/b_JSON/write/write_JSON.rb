#Enfin, cette réponse mentionne comment écrire un fichier JSON à partir d'un objet ruby.

require 'json'
tempHash = {
    "key_a" => "val_a",
    "key_b" => "val_b"
}
File.open("here/temp.json","w") do |f|
  f.write(tempHash.to_json)
  # f.write(JSON.pretty_generate(tempHash))
end
