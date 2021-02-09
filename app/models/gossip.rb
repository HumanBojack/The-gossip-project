class Gossip < ApplicationRecord
<<<<<<< HEAD
	validates :title, presence:true, length: { in: 3..14 }
	validates :content, presence:true
=======
	validates :title, presence true, length: { minimum: 3 }
	validates :content, presence true,
>>>>>>> 54f104284a5046e5b0547da049472a6b137e31f8
	belongs_to :user
	has_many :given_tags
end
