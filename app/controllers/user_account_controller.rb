class UserAccountController < ApplicationController
  def index
  end
  def delete
    #byebug
    session[:user_id] = nil
    current_user.destroy
    redirect_to register_url, notice: "Your Account was successfully deleted!"
  end
end
