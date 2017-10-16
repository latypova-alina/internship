class FeedbacksController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  expose_decorated :feedback, attributes: :feedback_params
  expose_decorated :feedbacks, -> { Feedback.all }

  def create
    feedback.save
    flash[:notice] = "Feedback was successfully sent!"
    redirect_to root_url
    FeedbackMailer.feedback_email.deliver_later
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end

  def index
    authorize feedback
    @search = Feedback.ransack(params[:q])
    @searched_feedbacks = @search.result
    smart_listing_create(:feedbacks, @searched_feedbacks,
      partial: "feedbacks/feedback_collection", default_sort: { created_at: "desc" })
  end
end
