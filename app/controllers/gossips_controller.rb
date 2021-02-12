class GossipsController < ApplicationController
  before_action :login_detection, except: [:index]
  before_action :creator_detection, only: [:edit, :update, :destroy]

  def index
  	@gossips = Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user
  	if @gossip.save
  		redirect_to @gossip, notice: "Successfully created"
  	else
      flash.now.alert = "Error: Title and Body must exist"
      render :new
  	end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: "Successfully updated"
    else
      rend :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: "Post deleted !"
  end


  private
  def gossip_params
  	params.require(:gossip).permit(:title, :content)
  end

  def login_detection
    redirect_to gossips_path, alert: "You need to be logged in to do that" unless is_logged_in?
  end

  def creator_detection
    redirect_to gossip_path(params[:id]) unless Gossip.find(params[:id]).user == current_user
  end
end