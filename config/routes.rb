Rails.application.routes.draw do
  apipie

  namespace :api do
	  resources :stock_transactions, only: [:index, :show, :create]
	  resources :calendar_events, only: [:index, :show, :create]
	  resources :stock_summaries, only: [:index]
  end
end
