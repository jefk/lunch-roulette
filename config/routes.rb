Rails.application.routes.draw do
  root 'home#index'

  scope '/api' do
    resources :items, only: [:create]
    resources :searches, only: [:create]
  end
end
