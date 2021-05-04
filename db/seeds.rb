# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning database..."
# Movie.destroy_all
# List.destroy_all

puts "Creating movies..."
url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie|
  movie = Movie.new(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: movie["vote_average"]
  )
  movie.save
  puts "Created #{movie.title}"
end
puts "Finished creating movies!"

puts "Creating lists..."
# List.create(name: "Comedy 🎭")
# List.create(name: "Horror 🔪")
# List.create(name: "Crime 🚨")
# List.create(name: "Alternative 🤷‍♀️")
puts "Finished creating lists!"