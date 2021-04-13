class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    # 前の画面に遷移
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post_id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
end
