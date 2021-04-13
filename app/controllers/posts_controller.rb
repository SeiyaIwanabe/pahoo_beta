class PostsController < ApplicationController

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
      # items = Item.all.order(created_at: :desc)
      # if params[:search].present?
      #   items = Item.items_serach(params[:search])
      # @items = Kaminari.paginate_array(items).page(params[:page]).per(10)
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
    @post = Post.find(params[:id])
    @user = @post.user
    @posts = @user.posts.order(created_at: "DESC")

    # コメントナビゲーション
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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
