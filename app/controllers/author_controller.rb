class AuthorController < ApplicationController
  def show
    @author = User.find(params[:id])
  end
end
