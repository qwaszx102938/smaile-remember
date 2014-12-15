class AccountActivationsController < ApplicationController
	#激活账号
	def get
	user=User.find_by(email:params[:email])
		if user && !user.activated? && user.authenticated?(:activation, params[:id])
			user.activate
			log_in user
			redirect_to user
		else
			flash[:danger] = "激活失败"
			redirect_to login_path
		end
	end
end

