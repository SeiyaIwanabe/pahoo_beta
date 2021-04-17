class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js  # create.js.erbが呼び出される
      else
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js { render :errors } # 一番最後に実装の解説あります
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find_by(post_id: @post.id)
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js  # destroy.js.erbが呼び出される
      else
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js { render :errors } # 一番最後に実装の解説あります
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
  
end

