class UsersController < ApplicationController
  before_action :move_to_login, only: [:show, :follow, :unfollow]


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
    @user = User.new
    # @user.tag_maps.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "#{@user.nickname}さん、ようこそ！"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id] )
    @posts = @user.posts.order(created_at: "DESC")
    @banners = @user.banners.order(created_at: "DESC")

    # ログインしているユーザーを探す
    @currentUserEntry = Entry.where(user_id: current_user.id)
    # チャットへを押されたユーザーを探す
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to action: :show, notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    @user.create_notification_follow!(current_user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end

  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :icon, { tag_ids: [] })
  end

  def move_to_login
    unless user_signed_in?
     redirect_to new_user_session_path
    end
  end
  
end
