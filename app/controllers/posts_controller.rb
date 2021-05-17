class PostsController < ApplicationController
  before_action :move_to_login, only: [:new]

  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @connect_users = @tag.users.order(created_at: "DESC")
    elsif params[:post_tag_id].present?
      @post_tag = PostTag.find(params[:post_tag_id])
      @connect_posts = @post_tag.posts.order(created_at: "DESC")
    elsif params[:banner_tag_id].present?
      @banner_tag = BannerTag.find(params[:banner_tag_id])
      @connect_banners = @banner_tag.banners.order(created_at: "DESC")
    end
    @tag_lists = Tag.all
    @posts_tag_lists = PostTag.all
    @banners_tag_lists = BannerTag.all
    @users = User.all.order(created_at: "DESC") 
    @posts = Post.all.order(created_at: "DESC")
    @banners = Banner.all.order(created_at: "DESC")
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

  def show
    @post = Post.find_by(id: params[:id] )
    @user = @post.user
    @posts = @user.posts.order(created_at: "DESC")

    # コメントナビゲーション
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: "DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
    # respond_to do |format|
    #   if post.update(post_params) && post.video.recreate_versions!
    #     format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
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
    unless user_signed_in?
     redirect_to new_user_session_path
    end
  end

end
