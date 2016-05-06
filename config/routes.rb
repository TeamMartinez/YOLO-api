Rails.application.routes.draw do
  # for auth GET: /auth/github
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/verify' => 'sessions#verify_auth'
  get '/auth/signout' => 'sessions#destroy'

  namespace :api do
    get 'stock_transactions/download' => 'stock_transactions#download'
    # define a singular resource to destroy all of the stock_transactions
    resource :stock_transactions, only: [:destroy]
    resources :stock_transactions, only: [:index, :show, :create]
    resources :calendar_events, only: [:index, :show, :create, :destroy] do
      get 'download' => 'calendar_events#download'
    end
    resources :stock_summaries, only: [:index]
    resources :stock_notes, only: [:index, :create]
  end
end
