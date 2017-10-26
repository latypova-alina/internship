class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, :text, presence: true
end
