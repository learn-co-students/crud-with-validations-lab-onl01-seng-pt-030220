class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true, if: :released_in_same_year?
  # validates :released, inclusion: { in: %w(true false) }
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year  }, if: :released?
  validates :artist_name, presence: true

  def released?
    released == true
  end

  def released_in_same_year?
    songs = Song.all
    songs.each do |song|
      if song.release_year.to_s.include?(self.release_year.to_s)
        true
      else
        false
      end
    end
  end
  
  
end
