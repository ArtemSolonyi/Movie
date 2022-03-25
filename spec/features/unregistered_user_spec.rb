require "rails_helper"
RSpec.feature "Unregistered user can" do
  User.destroy_all

  scenario "visit login form" do
    visit movies_path
    click_link "Log in"
    expect(visit '/users/sign_in')
  end

  scenario "visit sign up form" do
    visit '/users/sign_in'
    click_link "Sign up"
    expect(page).to have_button "Sign up"
  end

  scenario "register account" do
    visit '/users/sign_up'
    fill_in 'user[email]', :with => "new_account@mail.com"
    fill_in 'user[password]', :with => 'password123'
    fill_in 'user[password_confirmation]', :with => 'password123'
    click_button "Sign up"
    expect(page).to have_link "MoviesCenter"
  end

  scenario "visit login form from form sign_up" do
    visit '/users/sign_up'
    click_link 'Log in'
    expect(page).to have_button "Log in"
  end

  scenario "fill fields to login to account" do
    FactoryBot.create(:user,email:"new_account@mail.com",password:"password123",password_confirmation:"password123")
    visit '/users/sign_in'
    fill_in 'user[email]', :with => "new_account@mail.com"
    fill_in 'user[password]', :with => "password123"
    click_button "Log in"
    expect(page).to have_link "MoviesCenter"
  end

  before do
    Movie.destroy_all
    Category.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "click and view to movie page" do
    visit movies_path
    click_link "SpiderMan"
    expect(page).to have_content "Title: SpiderMan"
  end

  before do
    Category.destroy_all
    Movie.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "click to button login for rate from movie page" do
    visit movies_path
    click_link "SpiderMan"
    click_link "Log in"
    expect(page).to have_button "Log in"
  end

  before do
    Movie.destroy_all
    Category.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "back to movies from movie page" do
    visit movies_path
    click_link "SpiderMan"
    click_link "Back to movies"
    expect(page).to have_link "SpiderMan"
  end

  scenario "select category without movies" do
    Category.destroy_all
    Category.create!(name: 'Anime')
    visit movies_path
    select "Anime", from: "movie_category_id"
    click_button "Switch"
    expect(page).to have_content "The current category does not include films"
  end

  before do
    Movie.destroy_all
    Category.destroy_all
    FactoryBot.create(:movie)
  end
  scenario "select category on page movies" do
    visit movies_path
    select "Anime", from: "movie_category_id"
    click_button "Switch"
    expect(page).to have_link "SpiderMan"
  end

  scenario "click to pagination movies" do
    10.times { FactoryBot.create(:movie) }
    visit movies_path
    expect(page).to have_xpath("//*[@class='pagination']//a[text()='2']")
    find("//*[@class='pagination']//a[text()='2']").click
    expect(page.status_code).to eq(200)
  end


end