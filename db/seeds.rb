# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require'open-uri'
require'json'

def seeder

  @movie = Movie.new(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
  @list = List.new( genere: "Science Fiction")
  @bookmark = Bookmark.new(comment: "Ok film but dated from 1984")
  @bookmark.list = @list
  @bookmark.movie = @movie
  @movie.save
  @list.save
  @bookmark.save

  @movie = Movie.new(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
  @list = List.new( genere: "Drama")
  @bookmark = Bookmark.new(comment: "Great movie that launched Morgan Freeman's career")
  @bookmark.list = @list
  @bookmark.movie = @movie
  @movie.save
  @list.save
  @bookmark.save


  @movie = Movie.new(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
  @list = List.new( genere: "Historic")
  @bookmark = Bookmark.new(comment: "Still a young DiCaprio in one of his earlier endevours. Not one of my favourites")
  @bookmark.list = @list
  @bookmark.movie = @movie
  @movie.save
  @list.save
  @bookmark.save

  @movie = Movie.new(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
  @list = List.new( genere: "Action")
  @bookmark = Bookmark.new(comment: "Great line of very well known actors in an action packed thriller of a movie. Well worth the watch.")
  @bookmark.list = @list
  @bookmark.movie = @movie
  @movie.save
  @list.save
  @bookmark.save
end

def api_seeds
  api_key = "39e794b0fe1863071a29ac7f621500a8"
  n=2005
  while n < 2020
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{api_key}&primary_release_year=#{n}&region=GB&sort_by=vote_average.desc"
    puts "======>#{n}<======="
    # 10.times do |i|
      # puts "Importing movies from page #{i + 1}"
      movies_serialized = URI.open(url).read
      movies = JSON.parse(movies_serialized)["results"]
      # movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
      movies.each do |movie|
        puts "Creating #{movie['title']}"
        base_poster_url = "https://image.tmdb.org/t/p/original"
        Movie.create(
          title: movie['title'],
          overview: movie['overview'],
          poster_url: "#{base_poster_url}#{movie['poster_path']}",
          rating: movie['vote_average']
        )
      end
    n+=1
  end
end
  


puts "Cleansing Database..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
puts "... Database cleansed"
puts "Seeding Databse....."
seeder
api_seeds
puts "Seeding locally.... #{Movie.count} movie seeds"
puts "Seeding remotely.... #{List.count} list seeds"
puts "Seeding Completed!!!.... #{Bookmark.count} bookmark seeds"
