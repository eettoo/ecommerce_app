Rails.application.routes.draw do


  get '/home' => 'pages#home'

  get '/women' => 'pages#women'

  get '/man' => 'pages#man'



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
end
