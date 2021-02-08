class GossipsController < ApplicationController
  def list
  	@gossips = Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end
end
