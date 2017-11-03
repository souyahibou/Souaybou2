class Event < ApplicationRecord
      belongs_to :creator, class_name: "User"
      has_and_belongs_to_many :attendee, class_name: "User", :join_table => :Events_Users   #, foreign_key: "attented_event_id"
end
