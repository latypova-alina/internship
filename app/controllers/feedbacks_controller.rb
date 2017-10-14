class FeedbacksController < ApplicationController
  expose :feedback, attributes: :feedback_params

  def create
    feedback.save
    FeedbackMailer.feedback_email.deliver_later
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end

end
