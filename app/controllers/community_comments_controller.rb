class CommunityCommentsController < ApplicationController
  before_action :move_to_login, only: [:create, :destroy]

  def create
    @community_comment = CommunityComment.create(community_comment_params)
    respond_to do |format|
      if @community_comment.save
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js  # create.js.erbが呼び出される
      else
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
      end
    end
  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = current_user.comments.find_by(post_id: @post.id)
  #   respond_to do |format|
  #     if @comment.destroy
  #       format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
  #       format.js  # destroy.js.erbが呼び出される
  #     else
  #       format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
  #       format.js { render :errors } # 一番最後に実装の解説あります
  #     end
  #   end
  # end

  private
  def community_comment_params
    params.require(:community_comment).permit(:community_comment).merge(user_id: current_user.id, community_id: params[:community_id])
  end

  def move_to_login
    unless user_signed_in?
     redirect_to new_user_session_path
    end
  end
end
