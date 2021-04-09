class HomeController < ApplicationController

  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
    @banners = Banner.all.order(id: "DESC")
    @users = User.all
  end
  
end
