class User < ApplicationRecord
      has_many :created_events, foreign_key: "creator_id", class_name: "Event"
      has_and_belongs_to_many :attented_events, class_name: "Event", :join_table => :Events_Users             #foreign_key: "attendee_id",
end
