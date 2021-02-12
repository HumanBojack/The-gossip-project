class User < ApplicationRecord
	has_secure_password
	validates :first_name, presence: true, length: {in: 3..16}
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true, format: {with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/ ,message: "Email is not valid"}
	validates :password, presence: true
	belongs_to :city
	has_many :gossips, dependent: :destroy
	has_many :receivers
	has_many :private_messages
	has_many :comments, dependent: :destroy
	has_many :likes

	def remember(remember_token)
		remember_digest = BCrypt::Password.create(remember_token)
		self.update(remember_digest: remember_digest)
	end
end
