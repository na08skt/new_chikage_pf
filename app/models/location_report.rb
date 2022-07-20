class LocationReport < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_one_attached :image

  # コメントの関係
  belongs_to :user
  has_many :comments, dependent: :destroy

  # いいねの関係
  has_many :favorites, dependent: :destroy
  # いったよ機能の関係
  has_many :experiences, dependent: :destroy

# ↓使えないので、whereで対応↓
# 公開・非公開機能（投稿者の設定）
  # scope :unpublished, -> {where(publication_status: true)}
  scope :published, -> {where(publication_status: false)}
# なぜかpublic/location_report/showだけは機能が残っていた
# 公開・非公開機能（管理者の設定）
  # scope :admin_umpublished, -> {where(report_status: true)}
  # scope :admin_published, -> {where(report_status: false)}

  validates :title, presence: true
  validates :area, presence: true
  validates :body, presence: true
  validates :address, presence: true

  # 検索
  def self.search(keyword)
    where(["title like? OR body like? OR area like? OR address like? OR event like?", "%#{keyword}%", "%#{keyword}%",  "%#{keyword}%",  "%#{keyword}%",  "%#{keyword}%"])
  end
  
  # いいねがあるかチェック
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
# いったよがあるかチェック
  def experienced_by?(user)
    experiences.exists?(user_id: user.id)
  end
end
