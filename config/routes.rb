Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as:'home'
  get '/contact', to:'home#contact',as:'contact'
  get '/blog', to:'home#blog',as:'blog'
  get '/support', to:'home#support',as:'support'
  get '/about', to:'home#about',as:'about'

  #TODO change add_blog to new
  get '/add_blog', to:'blog#add_blog', as:'add_blog'
  post '/add_blog', to:'blog#article_create', as:'article_create'
  get '/article/show/:id', to:'blog#show', as:'article_show'
  #delete
  delete '/article/delete/:id', to:'blog#delete_article', as:'delete_article'
  #update
  get '/article/edit/:id',to:'blog#edit', as:'article_edit'
  patch '/article/edit/:id',to:'blog#update',as:'article_update'

  #sessions
  get '/login', to:'sessions#login',as:'login'
  post '/login', to:'sessions#new', as:'user_new'
  get '/register',to:'sessions#register',as:'register'
  post '/register',to:'sessions#create', as:'user_create'
  get '/logout', to:'sessions#logout', as:'logout'

  #account
  get '/account', to:'user_account#index', as:'account'
  delete '/account', to:'user_account#delete', as:'account_delete'
end
