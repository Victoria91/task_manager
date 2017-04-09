Rails.application.routes.draw do
  namespace :admin do
    resources :tasks
  end
  namespace :user do
    resources :tasks
  end

  get 'sign_in', to: 'application#sign_in'
end