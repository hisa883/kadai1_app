Rails.application.routes.draw do

   # rootをログイン画面に設定
  devise_scope :user do
    root "users/sessions#new"
    get 'dash_boards', to: 'users/dashboars'
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
end
