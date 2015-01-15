class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :extension_create

  def new
  end

  def create
    user=User.find_by email: (params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      #该行代码逻辑有问题
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger]='邮箱或密码错误'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end

  def extension_create
    #做好extension以后加上
    #if request.format=="json"
      user=User.find_by email: (params[:email].downcase)
      if user && user.authenticate(params[:password])
        #if user.extension_login
		  user.extension_login
          render json: {message:{result:"登陆成功"},
		  email: user.email, digest: user.remember_digest}
        #end
	  else 
	  render json: {message:{result:"密码或账号错误"}}
	  end
      #render json: {message: "error"}
    #else
    #end
    #render text:request.format
  end

end
