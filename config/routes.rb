Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :photos
  devise_for :users
  root to: 'boards#index'
  resources :boards
  # メールの確認用
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
