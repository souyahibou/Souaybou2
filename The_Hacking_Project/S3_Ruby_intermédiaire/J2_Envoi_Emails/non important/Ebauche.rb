require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'gmail'

def Operation_on_gmail(mails)
      Gmail.connect('sybknt@gmail.com', 'googledrive') do |gmail|
            puts gmail.logged_in?
#

              puts mails
              mails.each do |mail|
                puts mail

                email = gmail.compose do
                  to mail
                  subject "Having fun in Puerto Rico!"
                  body "Bonjour,
                        Je m'appelle Souyahibou , je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

                        Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à {townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec {townhall_name} !

                        Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80
                        "
                end
                email.deliver!
              end


        end
end


#s
charge les  dans google drive
def download_data_mail(table_data)
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("15qS0KtK9u_33jBD5SuPEItf_hTKf9aDMSDm9cRKeY8I").worksheets[0]   #cle a changer en fonction du lien url du fichier google drive
    table_of_mails=[]

     (1..(ws.num_rows + 1)).each do |row|
        table_of_mails << ws[row + 1, 3]
     end

     Operation_on_gmail(table_of_mails)
     ws.save
     ws.reload
end



#éxécution du code principal   ajout des autres fonction pour avoir une fichier synthèse total
def perform
    #  array_of_cities_data = get_all_the_urls_of_val_doise_townhalls()
    #  puts array_of_cities_data
     save_from_on_GoogleDrive
    #  save_data_in_json_file(array_of_cities_data)
    #  save_data_in_CSV_file(array_of_cities_data)
end

# appelle de la procédure
perform
