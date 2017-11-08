class FeedbacksController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  expose_decorated :feedback, attributes: :feedback_params
  expose_decorated :feedbacks, -> { Feedback.all }

  def create
    if feedback.save
      current_user.feedbacks << feedback if current_user
      flash[:notice] = "Feedback was successfully sent!"
      FeedbackMailer.feedback_email(feedback).deliver_later
    else
      flash[:alert] = "Check the fields!"
    end
    redirect_to new_feedback_path
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text, :user_id)
  end

  def index
    authorize feedback
    @search = Feedback.ransack(params[:q])
    @searched_feedbacks = @search.result
    smart_listing_create(:feedbacks, @searched_feedbacks,
      partial: "feedbacks/feedback_collection", default_sort: { created_at: "desc" })
  end
end
