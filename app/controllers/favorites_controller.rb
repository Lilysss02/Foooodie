class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.where(user_id: current_user.id)
	end

	def create
		@post = Post.find(params[:post_id])
		@favorite = current_user.favorites.create(post_id: params[:post_id])
		@favorites = Favorite.where(post_id: params[:post_id])
    end

	def destroy
		@post = Post.find(params[:post_id])
        @favorite = current_user.favorites.find_by(post_id: params[:post_id]).destroy
        @favorites = Favorite.where(post_id: params[:post_id])
	end
end
