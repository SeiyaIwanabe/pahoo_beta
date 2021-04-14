class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html{ redirect_back(fallback_location: root_path) } # 前の画面に遷移
      format.json
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find_by(post_id: @post.id)
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
  
end
