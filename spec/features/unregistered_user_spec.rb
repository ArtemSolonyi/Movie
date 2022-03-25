require "rails_helper"
RSpec.feature "Unregistered user can" do
  Capybara.default_driver = :selenium
  before do
    Movie.destroy_all
    Category.destroy_all
  end
  scenario "visit login form" do
    User.delete_all
    visit movies_path
    click_link "Log in"
    expect(page).to have_button "Log in"
  end
  before do
    Movie.destroy_all
    Category.destroy_all
  end
  scenario "visit sign up form" do
    User.delete_all
    visit '/users/sign_in'
    click_link "Sign up"
    expect(page).to have_button "Sign up"
  end
  before do
    Movie.destroy_all
    Category.destroy_all
    User.destroy_all
    FactoryBot.create(:user, email: "new_account@mail.com", password: "password123", password_confirmation: "password123")
  end
  scenario "get an error when  logging in with missing data" do
    User.delete_all
    visit '/users/sign_in'
    fill_in 'user[email]', :with => "new_account@mail.com"
    fill_in 'user[password]', :with => 'random1234'
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

  before do
    Movie.destroy_all
    Category.destroy_all
  end
  scenario "register account" do
    User.delete_all
    visit '/users/sign_up'
    fill_in 'user[email]', :with => "new_account@mail.com"
    fill_in 'user[password]', :with => 'password123'
    fill_in 'user[password_confirmation]', :with => 'password123'
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end
  before do
    Movie.destroy_all
    Category.destroy_all
  end
  scenario "visit login form from form sign_up" do
    User.delete_all
    visit '/users/sign_up'
    click_link 'Log in'
    expect(page).to have_button "Log in"
  end
  before do
    Movie.destroy_all
    Category.destroy_all
  end
  scenario "fill fields to login to exist account" do
    User.delete_all
    FactoryBot.create(:user, email: "new_account@mail.com", password: "password123", password_confirmation: "password123")
    visit '/users/sign_in'
    fill_in 'user[email]', :with => "new_account@mail.com"
    fill_in 'user[password]', :with => "password123"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  before do
    Movie.destroy_all
    Category.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "click and view to movie page" do
    User.delete_all
    Movie.destroy_all
    FactoryBot.create(:movie)
    visit movies_path
    click_link "SpiderMan"
    expect(page).to have_content "Title: SpiderMan"
  end

  before do
    Movie.destroy_all
    Category.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "click to button login for rate from movie page" do
    User.delete_all
    Movie.destroy_all
    FactoryBot.create(:movie)
    visit movies_path
    click_link "SpiderMan"
    click_link "Log in"
    expect(page).to have_button "Log in"
  end

  scenario "back to movies from movie page" do
    User.delete_all
    Movie.destroy_all
    FactoryBot.create(:movie)
    visit movies_path
    click_link "SpiderMan"
    click_link "Back to movies"
    expect(page).to have_link "SpiderMan"
  end

  before do
    Movie.destroy_all
    Category.create!(name: 'Anime')
  end
  scenario "select category without movies" do
    User.delete_all
    Category.destroy_all
    Category.create!(name: 'Anime')
    visit movies_path
    select "Anime", from: "movie_category_id"
    click_button "Switch"
    expect(page).to have_content "The current category does not include films"
  end

  scenario "select category on page movies" do
    User.delete_all
    Movie.destroy_all
    Category.destroy_all
    FactoryBot.create(:movie)
    visit movies_path
    select "Anime", from: "movie_category_id"
    click_button "Switch"
    expect(page).to have_link "SpiderMan"
  end
  before do
    Movie.destroy_all
    Category.destroy_all

  end
  scenario "click to pagination movies" do
    10.times { FactoryBot.create(:movie) }
    User.delete_all
    visit movies_path
    find('li.page-item:nth-child(3) > a:nth-child(1)').click
    expect(page).to have_css("li.page-item:nth-child(2) > a:nth-child(1)")
  end
  before do
    Movie.destroy_all
    Category.destroy_all
  end
  scenario "get an error when login without filling fields" do
    User.delete_all
    visit '/users/sign_in'
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password"
  end
end