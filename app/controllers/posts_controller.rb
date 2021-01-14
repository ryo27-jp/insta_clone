class PostsController < ApplicationController
  before_action :require_login, only: %i[new create show edit update]
  # sorceryでメソッドとして切り出されている

  def index
    # params[:page]がページ番号を受け取っている
    @posts = Post.includes(:user).page(params[:page]).order(created_at: :desc)
    # N+1問題を解消する為にincludesを使う(今回の場合.allより SQL発行数を減らす事ができる)
    @random_users = User.randoms(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿しました。'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])

    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, success: '投稿を更新しました。'
    else
      flash.now[:danger] = '投稿の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to post_path, success: '投稿を削除しました。'
  end

  private

  def post_params
    # 複数枚の画像を投稿した場合に配列で受け取る為
    params.require(:post).permit(:body, images: [])
  end
end
