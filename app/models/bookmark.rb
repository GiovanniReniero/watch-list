class Bookmark < ApplicationRecord
  belongs_to :movie #Each instance of Bookmark has one and only one instance of Movie
  belongs_to :list #Each instance of Bookmark has one and only one instance of List
  validates :comment, length: { minimum: 6 }
  validates :movie,  uniqueness: { scope: :list }
end
