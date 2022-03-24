require "rails_helper"
RSpec.feature "Unregistered user can" do
  scenario "visit login form" do
    visit '/'
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
    fill_in 'user[email]', :with => "my1@mail.com"
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
    visit '/users/sign_in'
    fill_in 'user[email]', :with => "my2@mail.com"
    fill_in 'user[password]', :with => "Lemon123"
    click_button "Log in"
    expect(page).to have_link "MoviesCenter"
  end

end