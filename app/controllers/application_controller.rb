class ApplicationController < ActionController::Base
  #TODO what are helpers and helper_method
  helper_method :current_user

  #TODO checking wether this will also work if we remove @current_user and just return the value of current_user
  def current_user
    if session[:id] && User.exists?(id: session[:id])
      @current_user = User.find(session[:id])
    else
      @current_user = nil
    end
  end
end
