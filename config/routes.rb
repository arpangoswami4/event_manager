Rails.application.routes.draw do

  resources :events do
    resource :reservations, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :users, only: %i[new create] do
    member do
      delete :logout
    end
    collection do
      get :login
      post :authenticate
    end
  end

  constraints ->(req) { req.session[:user_id].present? } do
    root to: 'events#index', as: :authenicated_root
  end

  root to: 'home#index'
end
