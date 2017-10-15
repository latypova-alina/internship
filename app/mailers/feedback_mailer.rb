class FeedbackMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def feedback_email
    mail(to: 'admin@example.com') do |format|
      format.text { render plain: "Feedback was successfully sent!" }
      format.html { render html: "Feedback was successfully sent!".html_safe }
    end
  end
end
