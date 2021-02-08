class Gossip < ApplicationRecord
	belongs_to :user
	has_many :given_tags
end
