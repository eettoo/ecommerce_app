Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "registrations" }

	namespace :admins do
		resources :orders, except: [:destroy]
		resources :products
	end

  devise_for :admins

  get '/home' => 'pages#home'

  get '/women' => 'pages#women'

  get '/men' => 'pages#men'

  get '/shopping-cart' =>'pages#shopping-cart'
  
  if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end

  resources :users

  namespace :shoppers do
	  resources :products, only: [:index, :show]
	  resources :baskets do
	  	resources :items_baskets
		end
	end

	resources :checkouts,  only: [:new, :create, :show]
  
  namespace :shoppers do
	  resources :orders do
	  	resources :items_paids
  	end
	end

  root "pages#index"
end
