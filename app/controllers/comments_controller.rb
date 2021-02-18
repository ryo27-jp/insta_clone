class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    # withで渡されるキーの値は,メイラーのアクションではparamsになる。deliver_laterはActiveJobを使って非同期で送信処理を行う（送信処理を待たずに遷移する）
    UserMailer.with(user_from: current_user, user_to: @comment.post.user, comment: @comment).comment_post.deliver_later if @comment.save && @comment.post.user.notification_on_comment?
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_update_params)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    # mergeメソッドでルーティングでネストされているpost_idを結合している。
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
