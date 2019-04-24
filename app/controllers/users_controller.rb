class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
	before_action :authenticate_user!
	def show
		@posts = @user.posts
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(current_user)
			flash[:success] = "ユーザ情報を更新しました。"
		else
			# if user.errors.messages[:user_name].include?(presence_error) then
			# 	flash[:danger] = "ユーザ名が空欄です。"
			# end
			redirect_to edit_user_path(current_user.id)
			flash[:warning] = "ユーザ情報の更新に失敗しました。"
		end
	end

	def destroy
	end

    def following
    	@users = @user.followings
    	render 'show_follow'
    end

    def followers
    	@users = @user.followers
    	render 'show_follower'
    end

	private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
    	params.require(:user).permit(:user_name, :image)
	end
end