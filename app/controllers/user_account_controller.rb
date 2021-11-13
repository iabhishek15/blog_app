class UserAccountController < ApplicationController
  def index
    if current_user == nil
      redirect_to home_url
    end
  end
  def delete
    #byebug
    session[:user_id] = nil
    current_user.destroy
    redirect_to signup_url, success_notice: "Your Account was successfully deleted!"
  end
end
