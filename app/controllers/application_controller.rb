class ApplicationController < ActionController::Base
  helper_method :current_user

  
  def login?
    if current_user.nil?
      redirect_to login_path, notice: "おいおい、ログインしないで投稿するつもりかい？"
    end
  end
  
  def already_login?
    unless current_user.nil?
      redirect_to root_path, notice: "もうログインしてるぜ"
    end
  end
  
 private
 def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
 end

end
