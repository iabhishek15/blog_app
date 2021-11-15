class HomeController < ApplicationController

  def index
    @articles = Article.paginate(page: params[:page], per_page:10).order('created_at DESC')
  end

  def search_user
    redirect_to home_path
    # logger.info "******************************search user is getting called"
    # user = User.find_by_username(params[:username])
    # if user
    #   @articles = Article.where(:user_id => user.id).paginate(page: params[:page], per_page:10).order('created_at DESC')
    #   render :index
    # else
    #   flash.now[:alert] = 'No such user exits!'
    #   @articles = nil
    #   render :index
    # end
  end

  def about
  end
  def contact

  end
  def support
  end
end

=begin
<% @articles.limit(3).order('created_at DESC').each do |article| %>
  <li>
    <%= link_to do %>
       <%= article.title %>
    <% end %>
  </li>
<% end %>
=end



=begin

<%= form_with(local:true,class:'navbar-form navbar-left') do |form| %>
  <div class="input-group">
    <%= form.text_field :username, class:'form-control', placeholder:'search' %>
  </div>
  <div class="input-group-btn">
    #TODO how to add btn btn-default class when using <%= form.submit do %>
    <%= form.submit do %>
      <i class="glyphicon glyphicon-search"></i>
    <% end %>
  </div>
<% end %>

=end


#https://intense-dawn-71889.herokuapp.com/
