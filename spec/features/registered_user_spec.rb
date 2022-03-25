require "rails_helper"
RSpec.feature "Registred User can" do


  scenario "logout from account" do
    login_as(FactoryBot.create(:user))
    visit movies_path
    click_button "Log out"
    expect(page).to have_link "Log in"
  end
  before do
    Movie.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "set rating from user" do
    Capybara.default_driver = :selenium
    Capybara.ignore_hidden_elements = false
    login_as(FactoryBot.create(:user))
    visit movies_path
    click_link "SpiderMan"
    rating = find(".rating > label:nth-child(11)")
    rating.click
    expect(page).to have_content "Rating: 6.0/10"
  end
end