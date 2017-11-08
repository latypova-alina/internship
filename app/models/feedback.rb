class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, :text, presence: true
  validates_format_of :email, with: Devise::email_regexp
end
