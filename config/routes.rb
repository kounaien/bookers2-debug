Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:show,:index,:create,:edit,:update,:delete]
  get 'home/about' => 'home#about'
end