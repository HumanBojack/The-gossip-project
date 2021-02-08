class WelcomeController < ApplicationController
  def show
  	@name = params[:name]
  end
end