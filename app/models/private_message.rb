class PrivateMessage < ApplicationRecord
	belongs_to :user
	has_many :receivers
end
