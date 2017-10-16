class FeedbackPolicy < ApplicationPolicy
  def index?
    @user && @user.admin
  end
end
