class FeedbacksController < ApplicationController
  expose_decorated :feedback, attributes: :feedback_params

  def create
    feedback.save
    flash[:notice] = "Feedback was successfully send!"
    redirect_to root_url
    FeedbackMailer.feedback_email.deliver_later
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end

end
