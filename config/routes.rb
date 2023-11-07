Rails.application.routes.draw do
  root "static_pages#index"
  
  get 'static_pages/index'
  get 'static_pages/secret'

  resources :events
  devise_for :users

end
