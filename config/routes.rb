Rails.application.routes.draw do

  namespace :users do
    get 'dash_boards/index'
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'users/dash_boards'
   # rootをログイン画面に設定
  devise_scope :user do
    root "users/sessions#new"
    
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
end
