class UsersController < ApplicationController
  def new
    @user = User.new
    # @user.tag_maps.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "待ってたぜ、相棒！"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:nickname, :id_name, :password, :password_confirmation, { tag_ids: [] })
  end
end
