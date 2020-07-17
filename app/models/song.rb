class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year]}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: -> { self.released == true }
  
  with_options if: :release_year do |song|
    # song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
  end

end
