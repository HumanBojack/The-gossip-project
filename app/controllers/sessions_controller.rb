class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: session_params["email"])
		puts session[:user_id]
		if user && user.authenticate(session_params["password"])
			log_in(user)
			redirect_to gossips_path
		else
			render :new
		end
	end

	def destroy
		session.delete(:user_id)
	end

	private
	def session_params
		params.require(:sessions).permit(:email, :password)
	end
end
