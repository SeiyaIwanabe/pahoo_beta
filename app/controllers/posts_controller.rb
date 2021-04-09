class PostsController < ApplicationController
  before_action :move_to_login

  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
    @banners = Banner.all.order(id: "DESC")
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '投稿を完了しました'
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:post_text, :post_video,  { post_tag_ids: [] } ).merge(user_id: current_user.id)
  end

  def move_to_login
    if current_user.nil?
      #サインインしていないユーザーはログインページが表示される
      redirect_to login_path
    end
  end

end
