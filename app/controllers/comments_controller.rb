class CommentsController < ApplicationController
  before_action :creator_detection, only: [:edit, :update, :destroy]

	def create
		@comment = Comment.new(comment_params)
		@comment.update(gossip: Gossip.find(params[:gossip_id]), user: current_user)

		@comment.save
		redirect_to gossip_path(params[:gossip_id])
	end

	def edit
		@gossip = Gossip.find(params[:gossip_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)

		@comment.save
		redirect_to gossip_path(params[:gossip_id])
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to gossip_path(params[:gossip_id])
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

  def creator_detection
    redirect_to gossip_path(params[:gossip_id]) unless Comment.find(params[:id]).user == current_user
  end

  def comment_owner?(comment)
  	comment.user == current_user
  end
end
