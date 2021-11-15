class ApplicationController < ActionController::Base
  #TODO what are helpers and helper_method
  helper_method :current_user
  before_action :set_articles_side, :set_flash_nil

  #TODO checking wether this will also work if we remove @current_user and just return the value of current_user
  def current_user
    puts "session id : #{session[:id]}"
    if session[:id] && User.exists?(id: session[:id])
      @current_user = User.find(session[:id])
    else
      @current_user = nil
    end
  end
  private

  def set_articles_side
    @articles_side =  Article.limit([5, Article.count].min).order('created_at DESC')
  end

  #TODO this is done so that flash[:alert] is set to empty string so that error message of login is not showed in signup
  def set_flash_nil
    flash.now[:alert] = ''
  end
end
