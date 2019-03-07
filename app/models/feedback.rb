class Feedback < ApplicationRecord
  validates :user_name, presence: true
  validates :comments, presence: true
end
