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

tour_photos = [
  "https://upload.wikimedia.org/wikipedia/commons/7/73/Rathaus_and_Marienplatz_from_Peterskirche_-_August_2006.jpg",
  "https://www.nationsonline.org/gallery/Germany/Theatiner-Church-Munich.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/d/da/Frauenkirche_Munich_-_View_from_Peterskirche_Tower2.jpg",
  "https://3iqhm91wtiv21y4zza4dqwj2-wpengine.netdna-ssl.com/wp-content/uploads/Germany-Munich-Upscale-Shopping-District.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/0/06/Basilika_Sankt_Paul_Munich_by_night.jpg",
  "https://www.gpsmycity.com/img/gd_sight/16189.jpg"
]

tour_names = ["Old town", "Viktualienmarkt", "Hop-On Hop-Off", "City Tour", "Spooky Tour of Old Town", "Romantic Road"]
starting_points = ["Marienplatz", "Rathaus", "Englischer Garten", "Nymphenburg Palace", "Munich Residenz", "Olympia Park"]
ending_points = ["Viktualienmarkt", "BMW Museum", "Peterskirche", "Deutsches Museum", "Asamkirche"]

tours = Array.new(6)

tours.each_with_index do |t, index|
  tour = Tour.new(
    name: tour_names[index],
    city: "Munich",
    starting_point: starting_points.sample,
    ending_point: ending_points.sample,
    description: Faker::Lorem.paragraphs(number: 5).join,
    duration: [90, 30, 120, 60].sample,
    price: [35, 39, 45, 49, 55, 59].sample
  )
  tour_photo = URI.open(tour_photos[index])
  tour.photo.attach(io: tour_photo, filename: tour.name, content_type: 'image/png')
  tour.user = users.sample
  tour.save!
  puts "Tour #{tour.name} created!"
end
