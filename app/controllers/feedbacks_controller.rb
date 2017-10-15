class FeedbacksController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

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

  def index
    smart_listing_create(:feedbacks, Feedback.all,
      partial: "feedbacks/feedback_collection", default_sort: {created_at: "desc"})
  end

end
