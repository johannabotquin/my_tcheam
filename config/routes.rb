Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "contact" => "pages#contact"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :tasks

  resources :teams, only: %i[new create show] do
    resources :rewards, except: %i[show]
    get "wheel", to: "teams#run_wheel"

    resources :rewards, except: %i[show] do
      member do
        get :select
      end
    end
  end

  resources :memories

  resources :chatrooms, only: %i[new create show] do
    resources :messages, only: :create
  end

  resources :users, only: :show do
    resources :lists
  end
end
