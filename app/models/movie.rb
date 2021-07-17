class Movie < ApplicationRecord
  has_many :bookmarks #Each instance of Movie has 0 or many instances of Bookmark there are suddenly 17 methods available for maipulating data in the corresponding join models, such as:
  # bookmarks = movie.bookmarks  
  # movie.bookmarks.count
  # movie.bookmarks.any?
  # movie.bookmarks.create(...)
  # movie.bookmarks.find(...)
  # ...more 
  validates :title, uniqueness: { case_sensitive: false }, presence: true

end
