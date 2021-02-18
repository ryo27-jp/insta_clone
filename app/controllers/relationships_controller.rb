class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    # if current_userがフォローした人の通知設定がtrueの時通知メールを送信する
    UserMailer.with(user_from: current_user, user_to: @user).follow.deliver_later if current_user.follow(@user) && @user.notification_on_follow?
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
