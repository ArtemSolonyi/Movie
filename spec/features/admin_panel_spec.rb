require "rails_helper"
RSpec.feature "Admin can" do
  Capybara.default_driver = :selenium
  scenario "fill fields to login" do
    User.delete_all
    FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'user[email]', :with => "my@mail.com"
    fill_in 'user[password]', :with => "Lemon123"
    click_button "Log in"
    expect(page).to have_link("+ Add Movie")
  end

  scenario "click to link for Add movie" do
    User.delete_all
    login_as(FactoryBot.create(:user))

    visit root_path
    expect(page).to have_link("+ Add Movie")
  end

  scenario "visit add movie panel" do
    login_as(FactoryBot.create(:user))
    visit new_movie_path
    expect(page).to have_content "New movie"
  end
  scenario "add movie" do
    User.delete_all
    login_as(FactoryBot.create(:user))
    Category.destroy_all
    Category.create!(name: 'Anime')

    visit new_movie_path
    fill_in "movie[title]", :with => "SpiderMan"
    fill_in "movie[text]", :with => "Description Movie"
    select "Anime", from: "movie_category_id"
    fill_in "movie[url]", :with => "0_movie.jpeg"
    click_button "Create Movie"
    expect(page).to have_content "Movie was successfully created."
  end
  scenario "back to movies" do
    User.delete_all
    login_as(FactoryBot.create(:user))
    visit new_movie_path
    click_link "Back to movies"
    expect(page).to have_link "MoviesCenter"
  end
  scenario "edit movie" do
    User.delete_all
    Movie.destroy_all
    FactoryBot.create(:movie)
    Category.create!(name: 'Action ')
    login_as(FactoryBot.create(:user))

    visit movies_path
    click_link "SpiderMan"
    click_link "Edit this movie"
    fill_in "movie[title]", :with => "NewSpiderMan"
    fill_in "movie[text]", :with => "Description Movie"
    select "Action", from: "movie_category_id"
    fill_in "movie[url]", :with => "1_movie.jpeg"
    click_button "Update Movie"
    expect(page).to have_content "Movie was successfully updated."

  end
  scenario "delete movie" do
    User.delete_all
    Movie.destroy_all
    FactoryBot.create(:movie)
    Category.create!(name: 'Action ')
    login_as(FactoryBot.create(:user))

    visit movies_path
    click_link "SpiderMan"
    click_button "Destroy this movie"
    expect(page).to have_content "Movie was successfully destroyed."
  end
  scenario "get errors when missing blank to new move" do
    visit new_movie_path
    fill_in "movie[title]", :with => "NewSpiderMan"
    click_button "Create Movie"
    expect(page).to have_content "Text can't be blank\nUrl can't be blank"
    fill_in "movie[text]",:with=>"newText"
    click_button "Create Movie"
    expect(page).to have_content "Url can't be blank"
    fill_in "movie[url]",:with=>"0_movie.jpeg"
    click_button "Create Movie"
    expect(page).to have_content "Movie was successfully created."
  end
end