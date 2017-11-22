Rails.application.routes.draw do
	root "users#new"
	resources :users, only: [:new, :create, :edit, :update, :show, :index]
	# please reconsider users#index, you dont need it
	resource :session, only: [:new, :create, :destroy]
	resources :lists do
		resources :tasks
	end
  # resource not resources, need to be singular, because at any one time, there can only be one session
  get "/lists/:list_id/tasks/:id/change_status_done" => "tasks#change_status_done"
  get "/lists/:list_id/tasks/:id/change_status_doing" => "tasks#change_status_doing"
  get "/lists/:list_id/tasks/:id/change_status_not_done" => "tasks#change_status_not_done"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
