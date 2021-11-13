class HomeController < ApplicationController

  def index

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
