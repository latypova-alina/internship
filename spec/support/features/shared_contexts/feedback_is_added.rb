require "rails_helper"

shared_context "feedback is added" do

  let(:feedback) { create :feedback }

  def add_feedback
    visit new_feedback_path
    fill_in "Name", with: feedback.name
    fill_in "Email", with: feedback.email
    fill_in "Text", with: feedback.text
    click_button "Create Feedback"
  end

  scenario "feedback is added" do
    visit root_path
    expect(page).to have_content "Add Feedback"
    add_feedback
    expect(page).to have_content "Feedback was successfully sent!"
    open_email('admin@example.com')
    expect(current_email).to have_subject("Feedback email")
  end
end
