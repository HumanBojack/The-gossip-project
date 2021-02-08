class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :receivers
	has_many :private_messages
end
