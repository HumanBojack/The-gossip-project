class Comment < ApplicationRecord
	validates :user, presence: true
	validates :content, length: {in: 10..100}
	belongs_to :user
	belongs_to :gossip
end
