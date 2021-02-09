class Gossip < ApplicationRecord
	validates :title, presence:true, length: { in: 3..14 }
	validates :content, presence:true
	belongs_to :user
	has_many :given_tags
end
