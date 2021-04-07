class SessionsController < ApplicationController

  def new
  end

  def create
    # @user = User.find_by(nickname: params[:nickname], id_name: params[:id_name])
    @user = User.find_by(id_name: params[:id_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to Pahoo!!"
    else
      flash.now[:alert] = "名前、ID、パスワードのどれかが違うぜ"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "また来てくれよな！"
  end

end
