Rails.application.routes.draw do
  root to: 'user/tasks#index'

  namespace :admin do
    resources :tasks
  end
  namespace :user do
    resources :tasks
  end

  get 'sign_in', to: 'application#sign_in'
  delete 'sign_out', to: 'application#sign_out', as: :sign_out
  post 'log_in', to: 'application#log_in'
end