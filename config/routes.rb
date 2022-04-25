Rails.application.routes.draw do
  post 'sessions/create', to: 'sessions#create', as: 'login'
  match 'sessions/destroy', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]
  resources :users
  get 'users/new', to: 'users#new', as: 'register'
  post 'users/create', to: 'users#create', as: 'create_user'
  get 'users/edit', to: 'users#edit', as: 'profile'
  put 'users/update', to: 'users#update', as: 'update_profile'
  get 'users/forgotten', to: 'users#forgotten', as: 'forgotten'
  post 'users/send_forgotten', to: 'users#send_forgotten', as: 'send_forgotten'
  resources :wines
  get 'say/hello', to: 'say#hello', as: 'hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
