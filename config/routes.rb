Rails.application.routes.draw do
  apipie
  resources :stock_transactions, only: [:index, :show, :create]
  resources :calendar_events, only: [:index, :show, :create]
  resources :stock_summaries, only: [:index]
end
