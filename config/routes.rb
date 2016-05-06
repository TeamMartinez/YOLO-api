Rails.application.routes.draw do
  # for auth GET: /auth/github
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/verify' => 'sessions#verify_auth'
  get '/auth/signout' => 'sessions#destroy'

  namespace :api do
    get 'stock_transactions/download' => 'stock_transactions#download'
    # define a singular resource to destroy all of the stock_transactions
    resources :stock_transactions, only: [:index]
    post 'stock_transactions/buy' => 'stock_transactions#buy'
    post 'stock_transactions/sell' => 'stock_transactions#sell'

    resources :stocks, only: [:index]

    resources :calendar_events, only: [:index, :show, :create, :destroy] do
      get 'download' => 'calendar_events#download'
    end

    resources :stock_notes, only: [:index, :create]
  end
end
