# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = %w[
Anime
Biographical
Action
Western
Military
Detective
Children's
Documentary
Drama
Рistorical
Movie
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
Reality
Family
Sport
Talk
Thriller
Horror
Fiction
Fantasy
Erotica
]

categories.each do |c|
  Category.create!(name:c)
end
titles = ["Spider-Man 2","The Frog","The Grinch","Spider-Man 3","Umma","So Cold The River","Cruella","The Matrix","Elysium","Spider-Man 4","Jumanji","Black Widow","Harry Potter"]
text = ["Synopsis. Set two years after the original, the film focuses on Peter Parker struggling to manage both his personal life and his duties as Spider-Man. The main villain in this film is Dr. Otto Octavius, who turns insane following a failed experiment and the death of his wife.",
        "In general, frogs have protruding eyes, no tail, and strong, webbed hind feet that are adapted for leaping and swimming. They also possess smooth, moist skins. Many are predominantly aquatic, but some live on land, in burrows, or in trees. A number depart from the typical form.",
        "The Grinch is depicted as a pot-bellied, furry, pear-shaped, snub-nosed creature with a cat-like face and cynical personality. In full-color adaptations, he is typically colored yellow green. He has spent the past 53 years living in seclusion on a cliff, overlooking the town of Whoville.",
        "Spider-Man 3 is a 2007 American superhero film based on the Marvel Comics character Spider-Man. It was directed by Sam Raimi from a screenplay by Raimi, his older brother Ivan and Alvin Sargent. It is the final installment in Raimi's Spider-Man trilogy, and the sequel to Spider-Man (2002) and Spider-Man 2 (2004). ",
        "Definitions of Umma. the Muslim community or people, considered to extend from Mauritania to Pakistan. synonyms: Islam Nation, Islamic Ummah, Muslim Ummah, Ummah. type of: community. a group of people living in a particular local area.",
        "A documentary filmmaker's research on a town's mysterious benefactor unearths an unexplained evil while staying at a local resort. A documentary filmmaker's research on a town's mysterious benefactor unearths an unexplained evil while staying at a local resort.",
        "Cruella, which is set in 1970s London amidst the punk rock revolution, follows a young grifter named Estella, a clever and creative girl determined to make a name for herself with her designs.",
        "The film describes a future in which reality perceived by humans is actually the Matrix, a simulated reality created by sentient Machines in order to pacify and subdue the human population while their bodies' heat and electrical activity are used as an energy source.",
        "A man takes on a mission that could bring equality to the polarized worlds. In the year 2154, two classes of people exist: the very wealthy, who live on a pristine man-made space station called Elysium, and the rest, who live on an overpopulated, ruined Earth.",
        "Spider-Man returns to face his greatest challenge yet as he faces off against The Vulture. Spider-Man returns to face his greatest challenge yet as he faces off against The Vulture. Spider-Man returns to face his greatest challenge yet as he faces off against The Vulture.",
        "The story centers on a supernatural board game that releases jungle-based hazards upon its players with every turn they take. As a boy in 1969, Alan Parrish became trapped inside the game itself while playing with his friend, Sarah Whittle. Twenty-six years later, siblings Judy and Peter Shepherd find the game, begin playing and then unwittingly release the now-adult Alan. After tracking down Sarah, the quartet resolves to finish the game in order to reverse all of the destruction it has caused. ",
        "Black widows are poisonous arachnids—animals that have a skeleton outside their body, a segmented body, and eight jointed legs. They are not insects. Their deadly poison is said to be 15 times stronger than rattlesnake venom.",
        "Throughout the series, Harry is described as having his father's perpetually untidy black hair, his mother's bright green eyes, and a lightning bolt-shaped scar on his forehead. He is further described as small and skinny for his age with a thin face and knobbly knees, and he wears Windsor glasses."]
category = [4,6,8,9,2,7,2,4,16,9,12,18,20]

(0..12).each do |m|
  Movie.create!(title:titles[m],text:text[m],category_id:category[m],url:"#{m}_movie.jpg")
end