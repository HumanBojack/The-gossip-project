class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: session_params["email"])
		if user && user.authenticate(session_params["password"])
			log_in(user)
			remember(user)
			redirect_to gossips_path
		else
			flash.now.alert = "Invalid email/password combination"
			render :new
		end
	end

	def destroy
		puts current_user
		log_out(current_user)
		redirect_to gossips_path, notice: "Logged out"
	end

	private
	def session_params
		params.require(:sessions).permit(:email, :password)
	end
end
