class AccountActivationsController < ApplicationController
	#�����˺�
	def get
	user=User.find_by(email:params[:email])])
		if user && !user.activated? && user.authenticated?(:activation, params[:id])
			user.activate
			log_in user
			redirect_to user
		end
		else
			flash[:danger] = "����ʧ��"
			redirect_to login_path
		end
	end
end
