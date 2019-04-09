Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts do
  	resource :favorite, only: [:index, :create, :destroy]
  end
  root 'posts#index'
  get '/posts/hashtag/:name', to:'posts#hashtags'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end