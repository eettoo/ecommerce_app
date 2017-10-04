Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	# namespace :admin do
	# 	resources :orders
	# 	resources :products
	# end
	
  devise_for :admins
  
  get '/home' => 'pages#home'

  get '/women' => 'pages#women'

  get '/men' => 'pages#men'

  
  namespace :shoppers do
	  resources :products, only: [:index, :show]
	  resources :baskets do 
	  	resources :items_baskets
		end
	end  

 #  namespace :shoppers do
	#   resources :orders do
	#   	resources :items_paids
 #  	end
	# end



  root to: "pages#index"
end
