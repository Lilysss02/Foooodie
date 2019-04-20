Rails.application.routes.draw do
  devise_for :users

  resources :users do
    member do
     get :following, :followers
   	end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
  	resource :favorites, only: [:create, :destroy]
  end
  get 'favorites/index', to: 'favorites#index'
  delete '/posts/:post_id/favorites/delete', to: 'favorites#delete', as: 'favorites_delete'
  root 'posts#index'
  get '/posts/hashtag/:name', to: 'posts#hashtags'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end