Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update] do
     member do
      get :follower, :followed
    end
  end
  resources :books,only: [:show,:index,:create,:edit,:update,:delete] do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'home/about' => 'home#about'
end