class LocationReport < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  # コメントの関係
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  # いいねの関係
  has_many :favorites, dependent: :destroy
end
