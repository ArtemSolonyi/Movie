require "rails_helper"
RSpec.feature "Users can view projects" do
  scenario "with the project details" do
    visit root_path
    expect(current_path).to eql root_path
  end
  scenario "with the project details" do
    visit "/movies"
    expect(page.current_url)
  end
end