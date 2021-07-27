class BannersController < ApplicationController
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
      # items = Item.all.order(created_at: :desc)
      # if params[:search].present?
      #   items = Item.items_serach(params[:search])
      # @items = Kaminari.paginate_array(items).page(params[:page]).per(10)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      redirect_to root_path, notice: 'バナーを作成しました'
    else
      render :new
    end
  end

  def show
    @banner = Banner.find(params[:id])
    @user = @banner.user

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

  def destroy
    banner = Banner.find(params[:id])
    banner.destroy
    redirect_to root_path
  end

  private
  def banner_params
    params.require(:banner).permit(:banner_name, :banner_image, :banner_details, :banner_tag_id).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
     redirect_to new_user_session_path
    end
  end

end
