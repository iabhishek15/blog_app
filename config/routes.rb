Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #nav
  root 'home#index', as:'home'

  get '/contact', to:'home#contact',as:'contact'
  get '/support', to:'home#support',as:'support'
  get '/about', to:'home#about',as:'about'
  #/article/new

  #TODO change add_blog to new
  get '/article/new', to:'article#new', as:'article_new'
  post '/article/new', to:'article#create', as:'article_create'
  get '/article/show/:id', to:'article#show', as:'article_show'
  #delete
  delete '/article/delete/:id', to:'article#delete', as:'article_delete'
  #update
  get '/article/edit/:id',to:'article#edit', as:'article_edit'
  patch '/article/edit/:id',to:'article#update',as:'article_update'

  #sessions
  get '/login', to:'sessions#login',as:'login'
  post '/login', to:'sessions#new', as:'user_new'
  get '/signup',to:'sessions#signup',as:'signup'
  post '/signup',to:'sessions#create', as:'user_create'
  get '/logout', to:'sessions#logout', as:'logout'

  #account
  get '/account', to:'user_account#index', as:'account'
  delete '/account', to:'user_account#delete', as:'account_delete'

  #comments
  post '/comment/new', to:'comment#new',as:'comment_new'
  delete '/comment/delete/:id', to:'comment#delete', as:'comment_delete'
end
