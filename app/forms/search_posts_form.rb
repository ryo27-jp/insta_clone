class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string
  attribute :comment_body, :string
  attribute :username, :string

  def search
    scope = Post.distinct
    scope = splited_bodies.map { |splited_body| scope.body_contain(splited_body) }.inject { |result, scp| result.or(scp) } if body.present?
    scope = scope.comment_body_contain(body) if comment_body.present?
    scope = scope.username_contain(username) if username.present?
    scope
  end

  private

  # 頭の半角空白文字を取り除き文字列が空白で区切られていた場合配列にして返す
  def splited_bodies
    body.strip.split(/[[:blank:]]+/)
  end
end
