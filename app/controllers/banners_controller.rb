class BannersController < ApplicationController

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
  end



  private

  def banner_params
    params.require(:banner).permit(:banner_name, :banner_tag, :banner_image).merge(user_id: current_user.id)
  end

end
