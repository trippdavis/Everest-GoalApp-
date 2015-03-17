Rails.application.routes.draw do
  resources :users do
    resources :user_comments, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :goals do
    resources :goal_comments, only: [:create]
  end
end
