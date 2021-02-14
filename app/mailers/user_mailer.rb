class UserMailer < ApplicationMailer

  def like_post
    # controllerのparamsと同じ様に使っている。コントローラーのwithで渡されるキーの値を受け取る。
    # アクションした人
    @user_from = params[:user_from]
    # された人
    @user_to = params[:user_to]
    # された投稿
    @post = params[:post]
    # to:が宛先 subject:がメールタイトル
    mail(to: @user_to.email, subject: "#{@user_from.username}があなたの投稿にいいねしました")
  end

  def comment_post
    @user_from = params[:user_from]
    @user_to = params[:user_to]
    @comment = params[:comment]
    mail(to: @user_to.email, subject: "#{@user_from.username}があなたの投稿にコメントしました")
  end

  def follow
    @user_from = params[:user_from]
    @user_to = params[:user_to]
    mail(to: @user_to.email, subject: "#{@user_from.username}があなたをフォローしました")
  end
end
