# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

require 'json'
require 'open-uri'

puts "Clean Database"
Movie.destroy_all
puts "Database cleaned"

puts "Inserting new movies"

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
read_films = URI.open(url).read
whole_list = JSON.parse(read_films)
movies = whole_list["results"]

# puts "#{results}"
# movies.each do |movie|
#   puts "#{movie["title"]}"
#   puts "#{movie["overview"]}"
#   puts "#{movie["vote_average"]}"
#   puts "#{movie["poster_path"]}"
# end

movies.each do |movie|
  movie = Movie.create(
  title: movie["title"],
  overview: movie["overview"],
  rating: movie["vote_average"],
  poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
)
puts "#{movie.title} is in the db!!"
end


# film_list.each do |movie|
#   movie = Movie.new(
#     title: film_list[:title],
#     overview: film_list[:overview],
#     rating: film_list[:vote_average],
#     poster_url: "https://image.tmdb.org/t/p/w500#{film_list[:poster_path]}"
#   )
#   movie.save!
#   puts "Movie : #{movie.title} is in the db"
# end

# puts "#{Movie.count} in the db"
