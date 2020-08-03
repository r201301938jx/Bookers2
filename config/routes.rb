Rails.application.routes.draw do
  root :to => 'home#top'
  get 'home/about'
  devise_for :users
  root 'books#index'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  get 'search' => 'searches#search'
  get 'chat/:id' => 'chat#show', as: 'chat'
  resources :chats, only: [:create]
end
