class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "This already exists!" }
end
# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
