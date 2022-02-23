require "faker"
require "open-uri"

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

tour_photos = ["", "", "", "", ""]

tour_photos.each do |photo|
  tour_photo = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
end

tour_names = ["Old town", "Viktualienmarkt", "Hop-On Hop-Off", "City Tour", "Spooky Tour of Old Town", "Romantic Road"]
starting_points = ["Marienplatz", "Rathaus", "Englischer Garten", "Nymphenburg Palace", "Munich Residenz", "Olympia Park"]
ending_points = ["Viktualienmarkt", "BMW Museum", "Peterskirche", "Deutsches Museum", "Asamkirche"]

tours = Array.new(10)

tours.each do
  tour = Tour.new(
    name: tour_names.sample,
    city: "Munich",
    starting_point: starting_points.sample,
    ending_point: ending_points.sample,
    description: Faker::Lorem.paragraphs(number: 5).join,
    duration: [90, 30, 120, 60].sample,
    price: [35, 39, 45, 49, 55, 59].sample
  )
  tour.photo.attach(io: tour_photo, filename: 'nes.png', content_type: 'image/png')
  tour.user = users.sample
  tour.save!
  puts "Tour #{tour.name} created!"
end
