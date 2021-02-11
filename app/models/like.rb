class Like < ApplicationRecord
	validates :user, presence: true
	validates :gossip, presence: true
	belongs_to :user
	belongs_to :gossip
end
