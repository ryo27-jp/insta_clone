# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  images     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  # 複数画像を扱う場合はmount_uploadersにしなければいけない。
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :body, presence: true, length: { maximum: 280 }
end
