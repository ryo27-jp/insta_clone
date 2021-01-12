# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string(255)
#  email            :string(255)      not null
#  salt             :string(255)
#  username         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # 関連づけられたuserが削除されたら紐づいたpostsも削除される.
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  # class_nameオプションで参照テーブルを指定、foreign_keyで参照カラム指定
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id" #フォローしている人
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id" #フォローされている人

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :followed_user, through: :followed, source: :follower # 自分をフォローしている人
  # メソッドとして定義しておくとview側での記述がスリムになる
  def own?(object)
    id == object.user_id
  end

  # postをlike_postsで取得した配列に格納する
  def like(post)
    like_posts << post
  end

  def unlike(post)
    like_posts.delete(post)
  end

  # like_postsで取得した配列とpostが == で等しい要素を持つ時にtrueを返す。
  def like?(post)
    like_posts.include?(post)
  end
end
