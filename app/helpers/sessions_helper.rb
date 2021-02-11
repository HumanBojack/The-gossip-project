module SessionsHelper
	def current_user
		User.find_by(id: session[:user_id])
	end

	def log_in(user)
		session[:user_id] = user.id
	end

	def is_logged_in?
		session[:user_id] != nil
	end
end
