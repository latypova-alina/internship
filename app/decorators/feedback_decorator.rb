class FeedbackDecorator < ApplicationDecorator
  delegate_all

  def feedback_sender_name
    if h.user_signed_in?
      "#{h.current_user.full_name}"
    end
  end

  def feedback_sender_email
    if h.user_signed_in?
      "#{h.current_user.email}"
    end
  end

end
