Rails.application.routes.draw do
  root 'cats#search'

  get :search,  to: 'cats#search'
end
