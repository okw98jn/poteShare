# == Route Map
#

Rails.application.routes.draw do
  get 'keyword_search', to: 'rooms#keyword_search'
  get 'search', to: 'rooms#search'
  get '/', to: 'home#top'

  get 'users/sign_in', to: 'users#sign_in'
  get 'users/sign_up', to: 'users#new'
  get 'users/profile', to: 'users#profile'
  get 'users/account', to: 'users#account'
  get 'users/edit', to: 'users#edit'
  post 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  resources :users
  resources :rooms
end
