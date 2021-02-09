class Gossip < ApplicationRecord
	validates :title, presence true, length: { minimum: 3 }
	validates :content, presence true,
	belongs_to :user
	has_many :given_tags
end
