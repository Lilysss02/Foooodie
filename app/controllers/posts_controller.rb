class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	# @posts = Post.all
    # @search = Post.search(params[:q])
    # @posts = @search.result
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to post_path(@post.id)
    else
      flash[:warning] = "投稿に失敗しました。"
      render 'new'
    end
  end

  def hashtags
  	@tag = Tag.find_by(name: params[:name])
  	@posts = @tag.posts
  end

  def edit
  end

  def update
    @post.images.detach
    # ActiveStorage::Attachmentのidを取得してPostモデルとBlobモデルのつながりを削除
    # if params[:post][:images].each do |image_id|
    #   image = @post.images.find(image_id)
    #   image.purge
    # end
    # end

    if @post.update(post_params)
      flash[:success] = "投稿を更新しました。"
      redirect_to post_path(@post.id)
    else
      flash[:warning] = "更新に失敗しました。"
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :used_at, :review, :shop_name, :shop_address, :shop_map, :latitude, :longitude, :price_id, :url, :status, :user_id, images: [])
  end

end
