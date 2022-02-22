require "faker"

Tour.destroy_all
puts "Previous tours deleted..."
User.destroy_all
puts "Previous users deleted..."

users = []
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Blockchain::Bitcoin.address
  )
  puts "> #{user.first_name} is created"
  users << user
end

tours = []
10.times do
  tour = Tour.new(
    name: ["old town", "Viktualienmarkt", "Hop-On Hop-Off", "City Tour", "Spooky Tour of Old Town", "Romantic Road"].sample,
    city: "Munich",
    starting_point: ["Marienplatz", "Rathaus", "Englischer Garten", "Nymphenburg Palace", "Munich Residenz", "Olympia Park"].sample,
    ending_point: ["Viktualienmarkt", "BMW Museum", "Peterskirche", "Deutsches Museum", "Asamkirche"].sample,
    description: Faker::Lorem.paragraphs(number: 5),
    duration: [2, 3, 4, 6].sample,
    price: [35, 39, 45, 49, 55, 59].sample
  )
  puts "> #{tour.name} is created"
  tours << tour
end

tours.each do |tour|
  tour.user = users.sample
  tour.save!
end
