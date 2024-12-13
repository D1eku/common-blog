Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks do
    resources :comments, only: [:create, :destroy]
  end
  #
  #get "/tasks", to: "tasks#index", as: :tasks
  #get "/tasks/new" => "tasks#new", as: :new_task
  #get "/tasks/:id" => "tasks#show", as: :task
  #patch "/tasks/:id" => "tasks#update"
  #delete "/tasks/:id" => "tasks#destroy"
  #get "/tasks/:id/edit" => "tasks#edit", as: :edit_task
  #post "/tasks" => "tasks#create", as: :create_task

  # Defines the root path route ("/")
  root "tasks#index"
end
