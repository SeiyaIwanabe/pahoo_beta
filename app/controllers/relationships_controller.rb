class RelationshipsController < ApplicationController
  # before_action :set_post

  def create
    @send = current_user.active_relationships.build(recipient_id: params[:user_id])
    @send.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @send = current_user.active_relationships.find_by(recipient_id: params[:user_id])
    @send.destroy
    redirect_back(fallback_location: root_path)
  end

  # private
  # def set_post
  #   @post = Post.find(params[:post_id])
  # end

end