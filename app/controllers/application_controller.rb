class ApplicationController < ActionController::Base
  #TODO what are helpers and helper_method
  helper_method :current_user
  before_action :set_articles

  #TODO checking wether this will also work if we remove @current_user and just return the value of current_user
  def current_user
    puts "session id : #{session[:id]}"
    if session[:id] && User.exists?(id: session[:id])
      @current_user = User.find(session[:id])
    else
      @current_user = nil
    end
  end

  def set_articles
    @articles = Article.paginate(page: params[:page], per_page:10)
  end
end
