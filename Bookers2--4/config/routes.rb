Rails.application.routes.draw do
  root 'top_page#top'
  get 'home/about' => 'top_page#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :index] do
      member do
        get :following, :followers
      end
    end
  resources :follow_relationships, only: [:create, :destroy]
    
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
end