require 'pry'
require "google_drive"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")

# Gets list of remote files.
session.files.each do |file|
  p file.title
end

# Uploads a local file.
session.upload_from_file("/home/syb8/Documents/Git/The_Hacking_Project/S3_Ruby_intermédiaire/J1_Excel/a_google_drive/hello.txt", "hello.txt", convert: false)

# # Downloads to a local file.
# file = session.file_by_title("hello.txt")
# file.download_to_file("/home/syb8/Documents/Git/The_Hacking_Project/S3_Ruby_intermédiaire/J1_Excel/a_google_drive/hello.txt")
#
# # Updates content of the remote file.
# file.update_from_file("/home/syb8/Documents/Git/The_Hacking_Project/S3_Ruby_intermédiaire/J1_Excel/a_google_drive/hello.txt")
