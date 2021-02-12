class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		user.city = City.find_by(name: params[:city])

		if user.save
			log_in(user)
			puts params["user"]["cookies"]
			remember(user) if params["user"]["cookies"] == "1"
			redirect_to gossips_path, notice: "You sucessfully created an account. Go ahead and start gossiping !"
		else
			redirect_to new_user_path
		end
	end

  def show
    @user = User.find(params[:id])
  end

  def profile
  	redirect_to user_path(current_user)
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :password, :email, :age, :description)
  end
end
