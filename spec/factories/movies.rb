FactoryBot.define do
  factory :movie do
    title { "SpiderMan" }
    text { "Description Movie" }
    category { Category.create!(name: 'Anime') }
    url { "0_movie.jpeg" }
  end
end
