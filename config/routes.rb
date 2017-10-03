Rails.application.routes.draw do

	namespace :admin do
		resources :orders, :products
	end


  devise_for :admins
  get '/home' => 'pages#home'

  get '/women' => 'pages#women'

  get '/men' => 'pages#men'



  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
end
