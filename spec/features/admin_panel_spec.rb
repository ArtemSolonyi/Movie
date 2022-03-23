require "rails_helper"
RSpec.feature "Admin can" do
  user = User.first

  scenario "click to login link" do
    visit '/'
    click_link "Log in"
    expect(visit '/users/sign_in')
  end

  scenario "fill fields to login" do
    visit '/users/sign_in'
    fill_in 'user[email]', :with => "my@mail.com"
    fill_in 'user[password]', :with => "Lemon123"
    click_button "Log in"
    expect(page).to have_link("+ Add Movie")
  end

  scenario "click to link for Add movie" do
    login_as(user)
    visit root_path
    expect(page).to have_link("+ Add Movie")
  end

  scenario "visit add movie panel" do
    login_as(user)
    visit '/movies/new'
    expect(page).to have_content "New movie"
  end
  scenario "add movie" do
    login_as(user)
    Category.create!(name: 'Anime')
    visit '/movies/new'
    fill_in "movie[title]", :with => "SpiderMan"
    fill_in "movie[text]", :with => "Description Movie"
    select "Anime", from:"movie_category_id"
    fill_in "movie[url]", :with => "https://thumbs.dfs.ivi.ru/storage28/contents/2/8/eae4a27c3d94ac97a6e69e66b4b6c0.jpg"
    click_button "Create Movie"
    expect(page).to have_content "Movie was successfully created."
  end
  scenario "back to movies" do
    login_as(user)
    visit '/movies/new'
    click_link "Back to movies"
    expect(page).to root_path
  end
end