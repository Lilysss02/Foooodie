class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

	def set_search
		@search = Post.ransack(params[:q])
		@posts = @search.result
	end

	protected

	# サインアップ時、user_nameのデータ操作が許可される
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
	end

	private

	# サインアウト後の遷移先
	def after_sign_out_path_for(resource)
    	new_user_session_path
  	end
end
