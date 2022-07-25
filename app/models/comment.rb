class Comment < ApplicationRecord
  belongs_to :location_report
  belongs_to :user

  validates :body, presence: true, length: { minimum:1, maximum: 30 }
end
