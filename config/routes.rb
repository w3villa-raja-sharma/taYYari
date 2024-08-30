Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/create'
  get 'otp/new'
  get 'otp/create'
  get 'otp/verify'

  post '/otp_check', to: 'otp#verify', as: 'otp_check'

  # root 'otp#new'

  devise_for :users , controllers: {
    registration: 'users/registration',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  resource :payments, only: [:new, :create]

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check



  get 'users/auth/:provider/callback', to: 'sessions#omniauth'
  
  get '/auth/failure', to: redirect('/')


  # Defines the root path route ("/")
  # root "posts#index"
end
