class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  # コメントの関係
  has_many :location_reports,dependent: :destroy
  has_many :comments, dependent: :destroy

  # いいねの関係
  has_many :favorites, dependent: :destroy

  # いったよ機能
  has_many :experiences, dependent: :destroy

  # フォローの関係
  has_many :relationships, foreign_key: :following_id
  # あるユーザーがフォローしているユーザー全員を探す
  has_many :followings, through: :relationships, source: :follower

  # フォローされる側からのrelationshipと重複してしまうため、名前を変更
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  validates :account_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # validates :introduction, length: { maximum: 30 }
  # validates :admin_comment, length: { maximum: 50 }


  # 検索
  def self.search(keyword)
    where(["account_name like? OR introduction like? OR user_rank like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  def self.looks(word)
    @user = User.where("account_name LIKE?", "%#{word}%")
  end

  # ユーザにフォローされてるかどうかを調べるメソッド
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end


end
