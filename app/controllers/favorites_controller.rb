class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.where(user_id: current_user.id)
	end

	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.new(post_id: post.id)
		added_favorite = current_user.favorites.find_by(post_id: favorite.post.id)
  		# 存在しなければ新たにお気に入りに追加
  		if  added_favorite == nil
  			favorite.save
  		else
  		end
    end

	def destroy
		post = Post.find(params[:post_id])
        favorite = current_user.favorites.find_by(post_id: post.id)
        favorite.destroy
	end
end
