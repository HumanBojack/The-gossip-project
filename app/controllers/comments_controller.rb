class CommentsController < ApplicationController

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
		@comment = Comment.find(params[:gossip_id])
		@comment.destroy
		redirect_to gossip_path(params[:id])
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
