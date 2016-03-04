Rails.application.routes.draw do
  apipie

  # for auth GET: /auth/github
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


  namespace :api do
	  get 'verify_auth' => 'sessions#verify_auth'
  	get 'stock_transactions/download' => 'stock_transactions#download'
	  # define a singular resource to destroy all of the stock_transactions
	  resource :stock_transactions, only: [:destroy]
	  resources :stock_transactions, only: [:index, :show, :create]
	  resources :calendar_events, only: [:index, :show, :create] do
	  	get 'download' => 'calendar_events#download'
	  end
	  resources :stock_summaries, only: [:index]
	  resources :stock_notes, only: [:index, :create]
  end
end
