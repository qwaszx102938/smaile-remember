class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only:[:index,:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update,:show]
  before_action :admin, only: [:destory]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  #debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
		  log_in @user
	    flash[:success]='注册成功'
        format.html { redirect_to @user}
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|

      if @user.update(update_user_params)
        flash[:success]='修改资料成功'
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
			format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	  def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password,:password_confirmation,:email)
    end

  def update_user_params
    params.require(:user).permit(:username,)
  end



  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      store_location
      flash[:danger] = "该用户没有权限，请登录正确用户"
      redirect_to login_url
    end
  end
  
    def admin
    logged_in_user
    unless @current_user.admin?
      store_location
      flash[:danger] = "需具备管理员权限"
      redirect_to login_url
    end
  end

end
