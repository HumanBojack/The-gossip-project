class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end


	def create
		@comment = Comment.new(comment_params)
		@comment.user = User.find(params["comment"]["id_user"])
		@comment.gossip = Gossip.find(params["comment"]["id_gossip"])
		@comment.save

	end




	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
