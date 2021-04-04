class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
    @banners = Banner.all.order(id: "DESC")
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
    params.require(:post).permit(:post_text, :post_video)
  end

end
