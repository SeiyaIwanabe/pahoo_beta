class PostsController < ApplicationController

  def index
    if params[:post_tag_id].present?
      @post_tag = PostTag.find(params[:post_tag_id])
      @connect_posts = @post_tag.posts.order(created_at: "DESC")
    end
      @tag_lists = Tag.all
      @posts_tag_lists = PostTag.all
      @users = User.all.order(created_at: "DESC") 
      @posts = Post.all.order(created_at: "DESC") 
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

end
