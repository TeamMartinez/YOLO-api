Rails.application.routes.draw do
  resources :stock_transactions, only: [:index, :show, :create]
  resources :calendar_events, only: [:index, :show, :create]
end
