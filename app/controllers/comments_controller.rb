class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    @comment.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def comment_params
      # mergeメソッドでルーティングでネストされているpost_idを結合している。
      params.require(:comment).permit(:body).merge(post_id: params[:post_id])
    end
end
