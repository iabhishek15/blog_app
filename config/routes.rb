Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as:'home'
  get '/contact', to:'home#contact',as:'contact'
  get '/blog', to:'home#blog',as:'blog'
  get '/support', to:'home#support',as:'support'
  get '/about', to:'home#about',as:'about'
  get '/login', to:'sessions#login',as:'login'
  get '/register',to:'sessions#register',as:'register'
  #TODO change add_blog to new 
  get '/add_blog', to:'blog#add_blog', as:'add_blog'
  post '/article/create', to:'blog#article_create', as:'article_create'
  get '/article/show', to:'blog#show', as:'show'
end
