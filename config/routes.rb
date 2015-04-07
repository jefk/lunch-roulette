Rails.application.routes.draw do
  root 'home#index'

  scope '/api' do
    resources :items, only: [:index]
  end
end
