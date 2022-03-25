require "rails_helper"
require "wait_ajax_helper"

RSpec.feature "Registred User can" do
  Capybara.default_driver = :selenium
  before do
    Movie.destroy_all
    User.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "logout from account" do
    login_as(FactoryBot.create(:user))
    visit movies_path
    click_button "Log out"
    expect(page).to have_link "Log in"
  end
  before do
    Movie.destroy_all
    Category.destroy_all
    User.destroy_all
    Rating.destroy_all
    FactoryBot.create(:movie, title: "SpiderMan", url: "0_movie.jpeg")
    login_as(FactoryBot.create(:user, email: "random@mail.com", password: "random123", password_confirmation: "random123"))
    Capybara.ignore_hidden_elements = true
  end

  scenario "set rating from user", :js => true do
    visit movies_path
    click_link "SpiderMan"
    choose('6', allow_label_click: true)
    wait_for_ajax
    expect(page).to have_content "Rating: 6.0/10"
  end
end