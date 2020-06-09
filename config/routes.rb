Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:show,:index,:create,:edit,:update,:delete] do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'home#about'
end