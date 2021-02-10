class CommentsController < ApplicationController


	def create
		@comment = Comment.new(comment_params)
		@comment.update(gossip: Gossip.find(params[:gossip_id]), user: User.find_by(first_name: "Anonymous"))

	 @comment.save
			redirect_to gossip_path(params[:gossip_id])

	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
