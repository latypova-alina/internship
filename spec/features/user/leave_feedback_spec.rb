require "rails_helper"

feature "Registered user can leave a feedback" do

  include_context "current user signed in"
  include_context "feedback is added"

  scenario "feedback is added with pre-filled fields" do
    visit new_feedback_path
    expect(find_field("Name").value).to eq current_user.full_name
    expect(find_field("Email").value).to eq current_user.email
  end

end
