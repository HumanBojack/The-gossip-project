class City < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :zip_code, presence: true, uniqueness: true
	has_many :users
end
