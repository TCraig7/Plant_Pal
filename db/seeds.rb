Plant.destroy_all
User.destroy_all
Category.destroy_all

user1 = User.create(username: 'sample1', password: 'password', role: 0)
user2 = User.create(username: 'sample2', password: 'password', role: 0)
user3 = User.create(username: 'sample3', password: 'password', role: 1)

plant1 = user1.plants.create(species: 'Philodendron Brasil', nickname: 'Steve', amount_of_water: 2, amount_of_sun: 1)
note1 = plant1.notes.create(content: "Needs to be watered every week.")
category1 = plant1.categories.create(name: "Sun Loving")

plant2 = user1.plants.create(species: 'Chinese Money Plant', nickname: 'Pancake', amount_of_water: 2, amount_of_sun: 2)
note2 = plant2.notes.create(content: "Needs bright but indirect light.")

plant3 = user1.plants.create(species: 'Barrel Cactus', nickname: 'Spike', amount_of_water: 1, amount_of_sun: 3)
note3 = plant3.notes.create(content: "Water every two weeks.")
category2 = plant3.categories.create(name: "Low Water")

plant4 = user2.plants.create(species: 'Bird of Paradise', nickname: 'Parrot', amount_of_water: 2, amount_of_sun: 3)
note4 = plant4.notes.create(content: "Likes humidity.")

plant5 = user2.plants.create(species: 'Sensitive Plant', nickname: 'Cutie', amount_of_water: 3, amount_of_sun: 2)
note5 = plant5.notes.create(content: "Likes to sit in water in a pebble tray.")
category3 = plant5.categories.create(name: "Water Loving")

plant6 = user2.plants.create(species: 'Golden Pothos', nickname: 'Coffee', amount_of_water: 2, amount_of_sun: 1)
note6 = plant6.notes.create(content: "Hardy af.")
category4 = plant6.categories.create(name: "Hardy")
