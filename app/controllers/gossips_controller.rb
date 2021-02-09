class GossipsController < ApplicationController
  def index
  	@gossips = Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def new
  	@gossip = Gossip.new
  end

  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content] , user: User.find_by(first_name: "Anonymous"))
  	if @gossip.save
  		redirect_to @gossip
  	else
  		render :new
  	end
  end


  # private
  # def gossip_params
  # 	params.require(:gossip).permit()
end