class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
		@posts = @user.posts
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(current_user)
			flash[:success] = "ユーザ情報が更新されました。"
		else
			# if user.errors.messages[:user_name].include?(presence_error) then
			# 	flash[:danger] = "ユーザ名が空欄です。"
			# end
			redirect_to edit_user_path(current_user.id)
			flash[:warning] = "更新失敗しました。"
		end
	end

	def destroy
	end

	private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
    	params.require(:user).permit(:user_name, :image)
	end
end