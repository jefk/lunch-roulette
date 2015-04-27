Rails.application.routes.draw do
  root 'home#index'

  scope '/api' do
    resources :items, only: [:create, :destroy]
    resources :searches, only: [:create]
  end
end
