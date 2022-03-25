


FactoryBot.define do
  factory :movie do
    title {"SpiderMan"}
    text {"Description Movie"}
    category {Category.create!(name: 'Anime')}
    url {"https://thumbs.dfs.ivi.ru/storage28/contents/2/8/eae4a27c3d94ac97a6e69e66b4b6c0.jpg"}
  end
end
