class LikesController < ApplicationController
	before_action :already_liked, only: [:new]

	def new
		Like.create(user: current_user, gossip: Gossip.find(params[:gossip_id]))
		redirect_to gossip_path(params[:gossip_id])
	end

	def destroy
		Like.find_by(user: current_user, gossip: Gossip.find(params[:gossip_id])).destroy
		redirect_to gossip_path(params[:gossip_id])
	end

	private
	def already_liked
		redirect_to gossip_path(params[:gossip_id]) if Like.find_by(user: current_user, gossip: Gossip.find(params[:gossip_id]))
	end
end
