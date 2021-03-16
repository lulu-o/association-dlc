Rails.application.routes.draw do



  devise_for :users
  root to: 'partners#index'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :partners, only: [:index, :show]
  resources :users, only: [:show, :edit, :update] do
  	resources :favorites, only: [:index, :create, :update]
  end
	resources :favorites, only: [:destroy]
  resources :harvests, only: [:index, :show]
  resources :harvesters, only: [:show, :create, :destroy]
  resources :distributions, only: [:new, :create, :index, :show]

  resources :admin, only: [:index]

  post 'notifications', to: 'harvests#send_notif'

 # root to: 'harvests#index'
 # resources :send_emergency_email, only: [:index]

end
