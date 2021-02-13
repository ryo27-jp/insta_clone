class ActivitiesController < ApplicationController
  before_action :require_login, only: %i[read]

  def read
    activity = current_user.activities.find(params[:id])
      # enumで定義しているunread(false)だった場合read(true)へ
    activity.read! if activity.unread?
      # redirect_pathヘルパーでaction_typeに応じた遷移先を指定する
    redirect_to activity.redirect_path
  end
end
