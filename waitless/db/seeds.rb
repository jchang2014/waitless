# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

results = [
  "mourad-restaurant-san-francisco",
  "the-flying-falafel-san-francisco-3",
  "marlowe-san-francisco-2",
  "cockscomb-san-francisco",
  "garaje-san-francisco",
  "zero-zero-san-francisco",
  "box-kitchen-san-francisco",
  "so-san-francisco-4",
  "tropisueño-san-francisco-3",
  "the-pink-elephant-san-francisco-3",
  "citizens-band-san-francisco",
  "little-skillet-san-francisco-2",
  "jamber-san-francisco",
  "picnic-on-third-san-francisco",
  "hrd-san-francisco-2",
  "dragoneats-san-francisco-3",
  "freshroll-vietnamese-rolls-and-bowls-san-francisco",
  "red-dog-restaurant-and-bar-san-francisco",
  "bluestem-brasserie-san-francisco",
  "archive-bar-and-kitchen-san-francisco"

]

results.map {
  |result| Restaurant.create(yelp_id: result)
}
