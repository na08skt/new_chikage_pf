class LocationReport < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # コメントの関係
  belongs_to :user
  has_many :comments, dependent: :destroy

  # いいねの関係
  has_many :favorites, dependent: :destroy
  # いったよ機能の関係
  has_many :experiences, dependent: :destroy

# 公開・非公開機能
  scope :unpublished, -> {where(publication_status: true)}
  scope :published, -> {where(publication_status: false)}

# いいねがあるかチェック
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
# いったよがあるかチェック
  def experienced_by?(user)
    experiences.exists?(user_id: user.id)
  end
end
