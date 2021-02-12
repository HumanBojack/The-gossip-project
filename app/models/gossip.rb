class Gossip < ApplicationRecord
	validates :title, length: {in: 3..50, message: "Title must be between 3 and 50 characters"}
	validates :content, presence: true
	validates :user, presence: true
	belongs_to :user
	has_many :given_tags
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :users, through: :likes
end