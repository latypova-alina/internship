class FeedbackMailer < ApplicationMailer
  default from: "notifications@example.com"

  def feedback_email(feedback)
    @feedback = feedback
    mail(to: "admin@example.com", subject: "New Feedback")
  end
end
