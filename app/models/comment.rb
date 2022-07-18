class Comment < ApplicationRecord
  belongs_to :location_report
  belongs_to :user
end
