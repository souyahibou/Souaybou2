require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'gmail'

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
    Operation_on_gmail(download_data_mail)
    Operation_on_gmail([['moi','','syb.k@live.fr'],['moi2','','souaybou.k@live.fr'],['moi3','','sybknt@gmail.com']])   #for test 1arg for name_of_townhall 2arg inutile 3arg le mail
end

# appelle de la procédure principale d'éxécution du code
perform
#249envoyé/433
