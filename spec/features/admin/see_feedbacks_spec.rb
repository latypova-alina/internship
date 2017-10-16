require "rails_helper"

feature "Admin can see and search through list of feedbacks" do
  include_context "current admin signed in"

  let!(:first_feedback) { create :feedback }
  let!(:second_feedback) { create :feedback }

  def see_list(feedback)
    expect(page).to have_content feedback.name
    expect(page).to have_content feedback.email
    expect(page).to have_content feedback.text
  end

  def included_in_results(searched_feedback)
    expect(page).to have_content searched_feedback.text
    expect(page).to have_content searched_feedback.name
  end

  def not_included_in_results(unsearched_feedback)
    expect(page).not_to have_content unsearched_feedback.text
    expect(page).not_to have_content unsearched_feedback.name
  end

  scenario "admin can see list of feedbacks" do
    visit feedbacks_path
    see_list(first_feedback)
    see_list(second_feedback)
  end

  scenario "search by name" do
    visit feedbacks_path
    fill_in "Name or Text Search", with: first_feedback.name
    click_button "Search"
    included_in_results(first_feedback)
    not_included_in_results(second_feedback)
  end

  scenario "search by text" do
    visit feedbacks_path
    fill_in "Name or Text Search", with: first_feedback.text
    click_button "Search"
    included_in_results(first_feedback)
    not_included_in_results(second_feedback)
  end
end
