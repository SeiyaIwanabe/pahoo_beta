class HomeController < ApplicationController
  before_action :move_to_login


  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
    @banners = Banner.all.order(id: "DESC")
    @users = User.all
  end
  
  private
  def move_to_login
    if current_user.nil?
      #サインインしていないユーザーはログインページが表示される
      redirect_to login_path
    end
  end
end
