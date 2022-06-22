Rails.application.routes.draw do

  namespace :users do
    get 'dash_boards/index'
    resources :articles
  end
  
  get 'users/dash_boards'
   # rootをログイン画面に設定
  devise_scope :user do
    root "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "signin", :to => "users/sessions#new"
    get "signout", :to => "users/sessions#destroy"
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
