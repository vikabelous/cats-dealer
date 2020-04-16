Rails.application.routes.draw do
  root 'home#index'

  get :search,  to: 'cats#search'
end
