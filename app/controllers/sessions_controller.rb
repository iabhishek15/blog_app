class SessionsController < ApplicationController
  def login
    if current_user
      redirect_to home_path
    end
    #byebug
  end

  def new
    user = User.find_by_username(params[:username])
    #TODO what does authenticate do?
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to home_url, notice: 'Logged In!'
      #byebug
    else
      flash[:alert] = 'Email or Password is Invalid'
      render :login
      #render :login
      #byebug
    end
  end

  def signup
    if current_user
      return redirect_to home_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html {redirect_to login_url, notice: 'Account was successfully created'}
      else
        format.html {render :signup, status: :unprocessable_entity}
      end
    end
  end

  def logout
    session[:id] = nil
    redirect_to home_url, notice: 'You are logged out!'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
