require "faker"
require "open-uri"

Booking.destroy_all
puts "Previous bookings deleted..."
Tour.destroy_all
puts "Previous tours deleted..."
User.destroy_all
puts "Previous users deleted..."

user_photos [
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641542998/upgrit4bif7ab8enrywz.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641496329/rksezyk6ndmyjuh3jp8b.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641197640/tltl66uk36iuhxjmt4wr.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641741818/rqxqd6d7kvehd8gfzj4z.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641194769/es5y4oty1ej25pmbckq6.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641489025/v0cccoyg5qgwifydqhlp.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1643376514/nfaf0gwsk3zgcnaodrtk.jpg",
  "https://avatars.githubusercontent.com/u/28245098?v=4",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641514195/rqald3eqzzvkqqycd21r.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1643622347/ekjbgb0bi3ac6zg3nn1t.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641735078/pyafw4bavxfeqmb0vj7c.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641554758/itw2hdjxge7nonvpoqae.jpg",
  "https://avatars.githubusercontent.com/u/97020679?v=4",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641491612/phy5oue4p0ftrjl3nnu7.jpg"
]
first_names = ["Christina", "Anna", "Romain", "Melissa", "Sophie", "Michelle", "Fotios", "Nicola", "Michael", "Mario", "Maximilian", "Hasib", "Sankar", "Yigit"]
last_names = ["Borensky", "Eiden", "Gille", "Hauck", "Hadeln", "Knolly", "Kolytoumpas", "Pilcher", "Pitopoulakis", "Rodríguez González", "Scheider", "Selimovic", "Ganesh Subramanian", "Tuncel"]
user_email = ["christina@borensky.com", "anna@eiden.com", "romain@gille.com", "melissa@hauck.com", "sophie@hadeln.com", "michelle@knolly.com", "fotios@kolytoumpas.com", "nicola@pilcher.com", "michael@pitopoulakis.com", "mario@rodríguez-gonzález.com", "maximilian@scheider.com", "hasib@Selimovic.com", "sankar@ganesh-subramanian.com", "yigit@tuncel.com" ]
user_password = ["secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret"]

users.each_with_index do |u, index|
  user = User.new(
    user_first_name: first_names[index],
    user_last_name: last_names[index],
    user_email: email[index],
    user_password: password[index]
  )
  puts "> #{user.first_name} is created"
  users << user
end

tour_photos = [
  "https://images.unsplash.com/photo-1471960098958-2059c6681742?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1901&q=80",
  "https://images.unsplash.com/photo-1587789202069-f57c846b85db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
  "https://images.unsplash.com/photo-1503152394-c571994fd383?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1586172992865-4dfff50bd23a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://cdn.pixabay.com/photo/2013/04/11/19/46/building-102840_1280.jpg",
  "https://images.unsplash.com/photo-1630219694734-fe47ab76b15e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=752&q=80",
  "https://cdn.pixabay.com/photo/2020/02/16/20/29/nyc-4854718_1280.jpg",
  "https://images.unsplash.com/photo-1561629611-00a11e09eafd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
  "https://images.unsplash.com/photo-1549944850-84e00be4203b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=768&q=80",
  "https://images.unsplash.com/photo-1588314941393-af1c493f345c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1033&q=80",
  "https://cdn.pixabay.com/photo/2017/10/18/10/19/munich-2863537_1280.jpg",
  "https://cdn.pixabay.com/photo/2020/05/21/17/40/allianz-arena-5201840_1280.jpg",
  "https://cdn.pixabay.com/photo/2019/10/28/07/15/the-roman-forum-4583598_1280.jpg",
  "https://cdn.pixabay.com/photo/2016/06/17/18/43/giraffe-1463820_1280.jpg",
  "https://cdn.pixabay.com/photo/2012/02/19/16/41/pamukkale-14999_1280.jpg",
  "https://images.unsplash.com/photo-1591742708307-ce49d19450d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"]

tour_names = ["Eiffel Tower", "Sagrada Familia", "Acropolis", "Walking Tour", "Louvre Museum", "Park Güell", "Empire State Building", "Harry Potter Tour", "Desert Tour", "Miracle Garden", "Old Town & Viktualienmarkt", "FC Bayern Munich Tour", "Forum Romanum & Colosseum", "Terra Natura", "Pamukkale Full-Day Tour", "Highlights of Cape Town"]
starting_points = ["Champs de Mars", "Sagrada Familia", "Apostolou Pavlou 11, Athens 118 51", "Anne Frank house", "Arc du Carrousel", "Carretera del Carmel", "Empire State Building", "Southwark View Point", "Dubai Marina", "Miracle Garden", "Marienplatz", "Allianz Arena", "Forum Romanum", "Entrance of Terra Natura Murcia", "Pick up from Izmir", "Green Market Square"]
ending_points = ["Summit of Eiffel Tower", "Sagrada Familia", "Acropolis museum", "Anne Frank house", "Louvre museum", "Park Güell", "Empire State Building", "Trafalgar Square", "Dubai Marina", "Miracle Garden", "Viktualienmarkt", "Allianz Arena", "Colosseum", "Terra Natura Murcia", "Your hotel in Izmir", "City Hall"]
city_names = ["Paris", "Barcelona", "Athens", "Amsterdam", "Paris", "Barcelona", "New York", "London", "Dubai", "Dubai", "Munich", "Munich", "Rome", "Murcia", "Izmir", "Cape Town"]
tour_description = ["Make the best use of your precious time in Paris with this direct access ticket to the Eiffel Tower. Choose from a 2nd level + summit or 2nd level-only ticket and follow a certified guide to learn the fascinating history of this world-famous landmark.",
              "Make your visit to the Sagrada Familia unforgettable with a 1.5-hour guided tour of Gaudí’s masterpiece. See the Basilica’s dream-like façade and interior in a small-group or private tour setting accompanied by an expert guide.",
              "Enjoy skip-the-ticket line access and discover the cradle of Western civilization on a guided visit to the Acropolis. Choose from either a small-group or private guided experience and indulge in tasty Greek treats when you upgrade to include a street food tour in Athen's old town.",
              "Visit famous sites of Amsterdam downtown and get an overview of the city on this 2.5-hour walking tour dedicated to culture and history. Profit from tips every adventurous traveler needs to know and make the best of your trip. Listen to your guide telling you which architectural designs were popular in the past and get an idea of the people of Amsterdam.",
              "Get priority entry access to the Louvre Museum and be led by an expert guide on a carefully planned route designed to maximize your time and give you a greater insight into the museum’s top highlights.",
              "Meet your guide in front of the Park Güell, skip the ticket line and discover this magnificent park designed by Antoni Gaudí more than 100 years ago. See the magnificent bridges, viaduct, and monumental zone.",
              "The New Empire State Building Experience not only gives you access to the legendary New York City landmark, allowing you to soar 1,054 foot (320 meters) high and enjoy magnificent 360-degree open-air views of New York City and beyond.",
              "Walk in the footsteps of your favorite wizards (and witches) around Muggle London. Your Harry Potter enthusiast guide will be armed with weird and wonderful trivia all along the way.",
              "After pickup from your hotel in a 4x4 Land Cruiser, you’ll head off with your local guide to the desert, just 45 minutes from Dubai. Upon reaching the Lahbab Desert, you’ll have about 20 minutes to relax. For the more adventurous, you can try quad biking, which is an optional activity.",
              "Walk around Dubai Miracle Garden, the world's largest natural flower garden, with this half-day skip-the-line ticket. Discover a surreal world surrounded by 50 million flowers. This is nature like you've never seen it before, be blown away by the sculptures that have won 3 Guinness World Records.",
              "Discover the sights of central Munich on an informative guided city walk. See Marienplatz, the Frauenkirche and the Staatliches Hofbräuhaus brewery. Visit the cathedral and Theatine Church. isten to interesting stories and anecdotes told by your guide, and learn more about the state capital of Bavaria and its citizens.",
              "The Allianz Arena, the temple of football in the north of Munich, is the third and most spectacular home of the long-standing football club Bayern Munich. Take a tour of this iconic stadium and learn all about the history of the team.",
              "Look down at the ruins of temples in the Imperial Forum, center of all political, social, and economic life in the city during the Roman Republic. Experience the most ancient parts of Rome from the most significant of its “Seven Hills.",
              "Terra Natura Murcia is a new-generation wildlife park, where you can discover a unique concept in habitat design that enables you to come into contact with the animals as if there were no barriers between you. In the park you can see more than 500 animals of 50 different species, some of them in danger of extinction.",
              "We will depart from Izmir in the morning and two and a half hours later arrive at Pamukkale which means the cotton castle in Turkish. These white rock formations, known as travertines, are world famous and have been declared a UNESCO World Heritage Site.",
              "Cape Town, the Mother City, is a beautiful place steeped with history. This half-day tour will take you to all of the major points of interest and landmarks you need to see for your visit to be complete."]

tours = Array.new(16)

tours.each_with_index do |t, index|
  tour = Tour.new(
    name: tour_names[index],
    city: city_names[index],
    starting_point: starting_points[index],
    ending_point: ending_points[index],
    description: tour_description[index],
    duration: [90, 30, 120, 60].sample,
    price: [25, 35, 39, 45, 49, 55, 59].sample
  )
  tour_photo = URI.open(tour_photos[index])
  tour.photo.attach(io: tour_photo, filename: tour.name, content_type: 'image/png')
  tour.user = users.sample
  tour.save!
  puts "Tour #{tour.name} created!"
end
