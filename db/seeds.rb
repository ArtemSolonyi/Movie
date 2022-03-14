# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = %w[All
Anime
Biographical
Action movie
Western film
Military
Detective
Children's
Documentary
Drama
Рistorical
Movie comic
Comedy
Concert
Short
Crime
Melodrama
Mystic
Music
Cartoon
Musical
Scientific
Noir
Adventures
Reality show
Family
Sport
Talk show
Thriller
Horror
Fiction
Fantasy
Erotica
]

categories.each do |c|
  Category.create!(name:c)
end