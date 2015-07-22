#Seed users
user_list = [
  ['scooby', 'dooby@gmail.com', 'doo'],
  ['scrappy', 'dappy@gmail.com', 'doo'],
  ['velma', 'daphne@gmail.com', 'freddy'],
  ['derek', 'jeter@gmail.com', 'baseball'],
  ['mark', 'mcguire@gmail.com', 'steroids'],
  ['Patrick', 'Shelby@gmail.com', 'Scoobz'],
  ['WolfJob', 'WolfJob@gmail.com', 'WolfJob'],
  ['Barry', 'Bonds@gmail.com', 'steroids'],
  ['sonic', 'the@the.com', 'hedgehog']
]

user_list.each do |name, email, password|
    User.create(name: name, email: email, password: password)
end

User.create(name:"Jeff", email: "jeff", password: "jeff", admin: true)


#Seed Restaurants from yelp API
results_soma = [
  ["mourad-restaurant-san-francisco","Mourad Restaurant" ],
  ["the-flying-falafel-san-francisco-3", "The Flying Falafel"],
  ["marlowe-san-francisco-2", "Marlowe"],
  ["cockscomb-san-francisco", "Cockscomb"],
  ["garaje-san-francisco", "Garaje"],
  ["zero-zero-san-francisco", "Zero Zero"],
  ["box-kitchen-san-francisco", "Box Kitchen"],
  ["so-san-francisco-4","SO" ],
  ["tropisueño-san-francisco-3", "Tropisueño"],
  ["the-pink-elephant-san-francisco-3", "The Pink Elephant"],
  ["citizens-band-san-francisco", "Citizen's Band"],
  ["little-skillet-san-francisco-2", "Little Skillet"],
  ["jamber-san-francisco", "Jamber"],
  ["picnic-on-third-san-francisco", "Picnic on Third"],
  ["hrd-san-francisco-2", "HRD"],
  ["dragoneats-san-francisco-3", "DragonEats"],
  ["freshroll-vietnamese-rolls-and-bowls-san-francisco", "Freshroll Vietnamese Rolls & Bowls"],
  ["red-dog-restaurant-and-bar-san-francisco", "Red Dog Restaurant & Bar"],
  ["bluestem-brasserie-san-francisco", "Bluestem Brasserie"],
  ["archive-bar-and-kitchen-san-francisco", "Crepe-Madame"]
]

results_mission = [
  ["sous-beurre-kitchen-san-francisco-2", "Sous Beurre Kitchen"],
  ["thistle-san-francisco-8", "Bistro L'Aviateur"],
  ["bistro-l-aviateur-san-francisco-2", "Hoffmann's Grill & Rotisserie"],
  ["hoffmanns-grill-and-rotisserie-san-francisco", "Loló"],
  ["loló-san-francisco-4", "20 Spot"],
  ["20-spot-san-francisco", "Stuffed"],
  ["stuffed-san-francisco", "Beretta"],
  ["beretta-san-francisco", "El Farolito"],
  ["el-farolito-san-francisco-2", "The Tradesman"],
  ["californios-san-francisco", "Californios"],
  ["kazan-san-francisco", "Kazan"],
  ["the-tradesman-san-francisco-2", "Al's Place"],
  ["prubechu-san-francisco", "Prubechu"],
  ["als-place-san-francisco", "Limón Rotisserie"],
  ["limón-rotisserie-san-francisco-3", "Lazy Bear"],
  ["lazy-bear-san-francisco-5", "Local Mission Eatery"],
  ["local-mission-eatery-san-francisco", "The Front Porch"],
  ["the-front-porch-san-francisco", "Paprika"],
  ["paprika-san-francisco", "Hog & Rocks"],
  ["hog-and-rocks-san-francisco", "Lolinda"]]

results_embarcadero = [["coqueta-san-francisco", "Coqueta"],
 ["hog-island-oyster-co-san-francisco", "Hog Island Oyster Co"],
 ["roli-roti-gourmet-rotisserie-san-francisco", "Roli Roti Gourmet Rotisserie"],
 ["il-cane-rosso-san-francisco", "il Cane Rosso"],
 ["primavera-san-francisco", "Primavera"],
 ["la-mar-cebichería-peruana-san-francisco-4", "La Mar Cebichería Peruana"],
 ["waterbar-san-francisco", "Waterbar"],
 ["palomino-san-francisco-3", "Palomino"],
 ["chaya-brasserie-san-francisco", "Chaya Brasserie"],
 ["4505-meats-san-francisco-7", "4505 Meats"],
 ["frog-hollow-farm-market-and-cafe-san-francisco", "Frog Hollow Farm Market & Cafe"],
 ["perrys-san-francisco-6", "Perry's"],
 ["delica-san-francisco", "Delica"],
 ["boccalone-san-francisco-2", "Boccalone"],
 ["the-slanted-door-san-francisco", "The Slanted Door"],
 ["el-porteño-empanadas-san-francisco-4", "El Porteño Empanadas"],
 ["hillstone-san-francisco-4", "Hillstone"],
 ["pier-23-cafe-san-francisco", "Pier 23 Cafe"],
 ["fog-city-san-francisco-2", "Fog City"],
 ["gotts-roadside-san-francisco-2", "Gott's Roadside"]]

results_soma.map {
  |result| Restaurant.create(yelp_id: result[0], title: result[1])
}

results_mission.map {
  |result| Restaurant.create(yelp_id: result[0], title: result[1])
}

results_embarcadero.map {
  |result| Restaurant.create(yelp_id: result[0], title: result[1])
}


# Add owners for some restaurants
dragon_eats = Restaurant.where(yelp_id: "dragoneats-san-francisco-3").first
dragon_eats.user_id = 1

dragon_eats.save

lazy_bear = Restaurant.where(yelp_id: "lazy-bear-san-francisco-5").first
lazy_bear.user_id = 2
lazy_bear.save

hrd = Restaurant.where(yelp_id: "hrd-san-francisco-2").first
hrd.user_id = 3
hrd.save


#Seed reservations
users = [5,6,7,8,9]

users.each do |user|
  dragon_eats.reservations.create(user_id: user, number_in_party: 3, name: "Person #{user}")
end