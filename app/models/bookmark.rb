class Bookmark < ApplicationRecord
  belongs_to :movie #Each instance of Bookmark has one and only one instance of Movie. Sudenly there are methods made avalable for manipulating data such as:
  # @bookmark = @movie.bookmark
  # @movie = @bookmark.movie 
  belongs_to :list #Each instance of Bookmark has one and only one instance of List
  validates :comment, length: { minimum: 6 }
  validates :movie,  uniqueness: { scope: :list, message:"The movie already belongs to this genere" }
end
