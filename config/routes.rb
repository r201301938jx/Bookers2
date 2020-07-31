Rails.application.routes.draw do
  root :to => 'home#top'
  get 'home/about'
  devise_for :users
  root 'books#index'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
