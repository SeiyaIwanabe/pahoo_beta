class HomeController < ApplicationController
  before_action :move_to_login


  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
    @banners = Banner.all.order(id: "DESC")
    @users = User.all
    @user = current_user
  end
  
  private
  def move_to_login
   unless user_signed_in?
    redirect_to new_user_session_path
   end
  end

end
