Rails.application.routes.draw do
  apipie

  namespace :api do
	  # define a singular resource to destroy all of the stock_transactions
	  resource :stock_transactions, only: [:destroy]  	
	  resources :stock_transactions, only: [:index, :show, :create]
	  resources :calendar_events, only: [:index, :show, :create]
	  resources :stock_summaries, only: [:index]
	  resources :stock_notes, only: [:index, :create]
  end
end
