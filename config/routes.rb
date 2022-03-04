Rails.application.routes.draw do



  devise_for :users
  root to: 'pages#landingpage'
  get '/partners' => "partners#index", :as => :user_root
  get 'contact', to: 'pages#contact'
  get 'landingpage', to: 'pages#landingpage'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :partners, only: [:index, :show]
  resources :users, only: [:show, :edit, :update, ] do
  	resources :favorites, only: [:index, :create, :update]
  end
	resources :favorites, only: [:destroy]
  resources :harvests, only: [:index, :show]
  resources :harvesters, only: [:show, :create, :destroy]
  resources :distributions, only: [:new, :create, :index, :show, :edit, :update]

  resources :admin, only: [:index]

  namespace :admin do
    resources :users
    resources :partners
    resources :associations
    resources :brands
  end

  post 'notifications', to: 'harvests#send_notif'

 # root to: 'harvests#index'
 # resources :send_emergency_email, only: [:index]

end
