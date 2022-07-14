class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # コメントの関係
  has_many :location_reports,dependent: :destroy
  has_many :comments, dependent: :destroy

  # いいねの関係
  has_many :favorites, dependent: :destroy

  # フォローの関係
  has_many :relationships, foreign_key: :following_id
  # あるユーザーがフォローしているユーザー全員を探す
  has_many :followings, through: :relationships, source: :follower

  # フォローされる側からのrelationshipと重複してしまうため、名前を変更
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  # ユーザにフォローされてるかどうかを調べるメソッド
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end
end
