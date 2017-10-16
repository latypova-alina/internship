require "rails_helper"

feature "Visitor can leave a feedback" do
  include_context "feedback is added"
  scenario "not-admin tries to see feedbacks list" do
    visit feedbacks_path
    expect(page).to have_content "You are not admin! >___>"
  end
end
