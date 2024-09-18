Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i[new create] do
    member do
      delete :logout
    end
    collection do
      get :login
      post :authenticate
    end
  end

  # constraints ->(req) { req.session[:user_id].present? } do
  #   root to: 'event#index', as: :authenicated_root
  # end

  root to: 'home#index'
end