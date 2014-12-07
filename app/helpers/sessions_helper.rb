module SessionsHelper
		def log_in(user)
			session[:user_id]=user.id
		end
	
		def current_user
		    if session[:user_id]
				@current_user ||= User.find_by id: session[:user_id]
			elsif cookies.signed[:user_id]
				user = User.find_by(id: cookies.signed[:user_id])
				if user && user.authenticated?(:remember,cookies[:remember_token])
				log_in user
				    #判断用户是否激活了。
					unless user.activated?
						unless flash[:warming].nil?
							flash[:warming]=flash[:warming]+"账户未激活"
						else
							flash[:warming]="账户未激活"
						end
					end
				@current_user = user
				end
			end
		end

		def logged_in?
				!current_user.nil?
		end

		def forget user
				user.forget
				cookies.delete(:user_id)
				cookies.delete(:remember_token)
		end
		
		def log_out
				forget(current_user)
				session.delete(:user_id)
				@current_user = nil
		end

		def remember(user)
				user.remember
				cookies.permanent.signed[:user_id] = user.id
				cookies.permanent[:remember_token] = user.remember_token
		end

		def redirect_back_or default
			redirect_to(session[:forwarding_url]||default)
		end

		def store_location
			session[:forwarding_url]=request.url if request.get?
		end
end
