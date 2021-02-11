module LikesHelper
	def already_liked?
		Like.find_by(user: current_user, gossip: Gossip.find(params[:id])) != nil
	end
end
