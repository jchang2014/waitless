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

results_soma = [
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

results_mission = [
"sous-beurre-kitchen-san-francisco-2",
"thistle-san-francisco-8",
"bistro-l-aviateur-san-francisco-2",
"hoffmanns-grill-and-rotisserie-san-francisco",
"loló-san-francisco-4",
"20-spot-san-francisco",
"stuffed-san-francisco",
"beretta-san-francisco",
"el-farolito-san-francisco-2",
"californios-san-francisco",
"kazan-san-francisco",
"the-tradesman-san-francisco-2",
"prubechu-san-francisco",
"als-place-san-francisco",
"limón-rotisserie-san-francisco-3",
"lazy-bear-san-francisco-5",
"local-mission-eatery-san-francisco",
"the-front-porch-san-francisco",
"paprika-san-francisco",
"hog-and-rocks-san-francisco"
]

results_embarcadero = [
"coqueta-san-francisco",
"hog-island-oyster-co-san-francisco",
"roli-roti-gourmet-rotisserie-san-francisco",
"il-cane-rosso-san-francisco",
"primavera-san-francisco",
"la-mar-cebichería-peruana-san-francisco-4",
"waterbar-san-francisco",
"palomino-san-francisco-3",
"chaya-brasserie-san-francisco",
"4505-meats-san-francisco-7",
"frog-hollow-farm-market-and-cafe-san-francisco",
"perrys-san-francisco-6",
"delica-san-francisco",
"boccalone-san-francisco-2",
"the-slanted-door-san-francisco",
"el-porteño-empanadas-san-francisco-4",
"hillstone-san-francisco-4",
"pier-23-cafe-san-francisco",
"fog-city-san-francisco-2",
"gotts-roadside-san-francisco-2"
]

results_soma.map {
  |result| Restaurant.create(yelp_id: result)
}

results_mission.map {
  |result| Restaurant.create(yelp_id: result)
}

results_embarcadero.map {
  |result| Restaurant.create(yelp_id: result)
}

