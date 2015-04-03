Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/pokemon/:id/capture', to:'pokemons#capture', as:'capture'
  patch '/pokemon/:id/damage', to:'pokemons#damage', as:'damage'
  resources :pokemons
end
