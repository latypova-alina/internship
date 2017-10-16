class FeedbackDecorator < ApplicationDecorator
  delegate_all

  def feedback_sender_name
    h.current_user.full_name if h.user_signed_in?
  end

  def feedback_sender_email
    h.current_user.email if h.user_signed_in?
  end
end
