Rails.application.routes.draw do
  resources :users do
    resources :comments, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :goals do
    resources :comments, only: [:create]
  end
end
