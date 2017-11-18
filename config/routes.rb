Rails.application.routes.draw do
	root "users#new"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  # resource not resources, need to be singular, because at any one time, there can only be one session


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
