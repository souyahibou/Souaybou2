class Post < ApplicationRecord
	belongs_to :author
	validates :author, presence: true
	validates :title: presence: true, uniqueness: true,
	validates :body, :author_id, prensence: true
end

