class Author < ApplicationRecord
	has_many :posts
	validates_associated :books
 	validates :username ,presence: true, length:{ in: 4..12}, uniqueness: true
	validates :email, presence: true, length:{maximum:16}, uniqueness: true
	validates :password, presence: true, length:{ in: 6..16} 
end
in: 
#valid?
#length:{is:16}
#numericality: true, allow_blank: true, allow_nil: true,absence: true
