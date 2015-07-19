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
