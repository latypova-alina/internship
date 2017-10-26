class Feedback < ApplicationRecord
  validates :email, :text, presence: true
  belongs_to :user
end
