class User < ApplicationRecord
	validates :first_name, presence: true, length: {in: 3..16}
	validates :last_name, presence: true
	validates :email, presence: true, format: {with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/ ,message: "Email is not valid"}
	belongs_to :city
	has_many :gossips
	has_many :receivers
	has_many :private_messages
end
