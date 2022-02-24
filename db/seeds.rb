require "faker"
require "open-uri"

Booking.destroy_all
puts "Previous bookings deleted..."
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
  "https://cdn.pixabay.com/photo/2018/04/25/09/26/eiffel-tower-3349075_1280.jpg",
  "https://images.unsplash.com/photo-1587789202069-f57c846b85db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
  "https://images.unsplash.com/photo-1503152394-c571994fd383?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1586172992865-4dfff50bd23a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://cdn.pixabay.com/photo/2013/04/11/19/46/building-102840_1280.jpg",
  "https://images.unsplash.com/photo-1630219694734-fe47ab76b15e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=752&q=80"
]

tour_names = ["Eiffel Tower", "Sagrada Familia", "Acropolis", "Walking Tour", "Louvre Museum", "Park Güell"]
starting_points = ["Champs de Mars", "Sagrada Familia", "Apostolou Pavlou 11, Athens 118 51", "Anne Frank house", "Arc du Carrousel", "Carretera del Carmel"]
ending_points = ["Summit of Eiffel Tower", "Sagrada Familia", "Acropolis museum", "Anne Frank house", "Louvre museum", "Park Güell"]
city_names = ["Paris", "Barcelona", "Athens", "Amsterdam", "Paris", "Barcelona"]
tour_description = ["Make the best use of your precious time in Paris with this direct access ticket to the Eiffel Tower. Choose from a 2nd level + summit or 2nd level-only ticket and follow a certified guide to learn the fascinating history of this world-famous landmark.",
               "Make your visit to the Sagrada Familia unforgettable with a 1.5-hour guided tour of Gaudí’s masterpiece. See the Basilica’s dream-like façade and interior in a small-group or private tour setting accompanied by an expert guide.",
               "Enjoy skip-the-ticket line access and discover the cradle of Western civilization on a guided visit to the Acropolis. Choose from either a small-group or private guided experience and indulge in tasty Greek treats when you upgrade to include a street food tour in Athen's old town.",
               "Visit famous sites of Amsterdam downtown and get an overview of the city on this 2.5-hour walking tour dedicated to culture and history. Profit from tips every adventurous traveler needs to know and make the best of your trip. Listen to your guide telling you which architectural designs were popular in the past and get an idea of the people of Amsterdam.",
               "Get priority entry access to the Louvre Museum and be led by an expert guide on a carefully planned route designed to maximize your time and give you a greater insight into the museum’s top highlights.",
               "Meet your guide in front of the Park Güell, skip the ticket line and discover this magnificent park designed by Antoni Gaudí more than 100 years ago. See the magnificent bridges, viaduct, and monumental zone."]

tours = Array.new(6)

tours.each_with_index do |t, index|
  tour = Tour.new(
    name: tour_names[index],
    city: city_names[index],
    starting_point: starting_point[index],
    ending_point: ending_point[index],
    description: tour_description[index],
    duration: [90, 30, 120, 60].sample,
    price: [35, 39, 45, 49, 55, 59].sample
  )
  tour_photo = URI.open(tour_photos[index])
  tour.photo.attach(io: tour_photo, filename: tour.name, content_type: 'image/png')
  tour.user = users.sample
  tour.save!
  puts "Tour #{tour.name} created!"
end
