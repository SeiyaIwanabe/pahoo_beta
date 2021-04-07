class UsersController < ApplicationController
  def new
    @user = User.new
    # @user.tag_maps.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "逢いたかったぜ。相棒"
    else
      render :new
    end
  end


  def show
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :id_name, :password, :password_confirmation, { tag_ids: [] })
  end
end
