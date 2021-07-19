# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
  @bookmark = Bookmark.new(comment: "Great line of very well known actros in an action packed thriller of a movie. Well worth the watch.")
  @bookmark.list = @list
  @bookmark.movie = @movie
  @movie.save
  @list.save
  @bookmark.save


  

end



puts "Cleansing Database..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
puts "... Database cleansed"
puts "Seeding Databse....."
seeder
puts "Seeding Completed!!!.... #{Movie.count} movie seeds"
puts "Seeding Completed!!!.... #{List.count} list seeds"
puts "Seeding Completed!!!.... #{Bookmark.count} bookmark seeds"
