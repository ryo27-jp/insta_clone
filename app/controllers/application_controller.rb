class ApplicationController < ActionController::Base
  before_action :set_search_posts_form
  add_flash_types :success, :info, :warning, :danger
  # flashメッセージにnoticeとalert以外を使える様にしている

  private

  def set_search_posts_form
    @search_form = SearchPostsForm.new(search_post_params)
  end

  # 第一引数のkeyが空だった場合エラーではなく第２引数defaultを返す。
  def search_post_params
    params.fetch(:q, {}).permit(:body, :comment_body, :username)
  end
end
