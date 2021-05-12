class HomeController < ApplicationController
  # before_action :move_to_login


  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
    @banners = Banner.all.order(id: "DESC")
    @users = User.all
    @user = current_user

    # コメントナビゲーション
    @comment = Comment.new
    
    # 通知一覧
    @notifications = current_user.passive_notifications if user_signed_in?
  end
  
  # private
  # def move_to_login
  #  unless user_signed_in?
  #   redirect_to new_user_session_path
  #  end
  # end

end
