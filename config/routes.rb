Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end

# users
get "/users", to: 'users#index'
get '/users/:id', to: 'users#show'
post '/users', to: 'users#create'
post '/users', to: 'users#register'
post '/users/login', to: 'users#login'
get '/user/login/check', to: 'users#check_login_status'
delete '/users/logout', to: 'users#logout'
# tasks
get "/tasks", to: 'tasks#index'
get '/tasks/:id', to: 'tasks#show'
post '/tasks', to: 'tasks#create'
put '/tasks/:id', to: 'tasks#update'
delete '/tasks/:id', to: 'tasks#destroy'
 # todos
 post '/todos', to: 'todos#create'
 put '/todos/:id', to: 'todos#update'
 delete '/todos/:id', to: 'todos#destroy'
 get '/todos', to: 'todos#index'
# reminders
post 'reminders', to: 'reminders#create'
# category
end
