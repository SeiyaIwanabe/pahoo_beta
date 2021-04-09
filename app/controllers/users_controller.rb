class UsersController < ApplicationController

  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @connect_users = @tag.users.order(created_at: "DESC")
    elsif params[:post_tag_id].present?
      @post_tag = PostTag.find(params[:post_tag_id])
      @connect_posts = @post_tag.posts.order(created_at: "DESC")
    end
      @tag_lists = Tag.all
      @posts_tag_lists = PostTag.all
      @users = User.all.order(created_at: "DESC") 
      @posts = Post.all.order(created_at: "DESC") 
      # items = Item.all.order(created_at: :desc)
      # if params[:search].present?
      #   items = Item.items_serach(params[:search])
      # @items = Kaminari.paginate_array(items).page(params[:page]).per(10)
  end

  def new
    @user = User.new
    # @user.tag_maps.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to Pahoo!!"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id] )
    @posts = @user.posts.order(created_at: "DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to action: :show, notice: "プロフィールを更新しました！"
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :id_name, :password, :password_confirmation, :icon, { tag_ids: [] })
  end
end
