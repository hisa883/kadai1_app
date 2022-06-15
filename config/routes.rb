Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get 'dash_boards'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
