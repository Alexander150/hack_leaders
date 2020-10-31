Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post '/login', to: "users#login"
  post '/check', to: "users#check_user"
  get '/auto_login', to: "users#auto_login"
  post '/tasks/check', to: "tasks#check"
  get "tasks/:id", to: "tasks#get_task"
end
