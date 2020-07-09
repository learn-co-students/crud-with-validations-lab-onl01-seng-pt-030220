class Song < ApplicationRecord
  ######## my original solution #########
  # validates :title, presence: true, uniqueness: true, if: :released_in_same_year_and_same_artist?
  # validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year  }, if: :released?
  # validates :artist_name, presence: true

  # def released?
  #   released == true
  # end

  # def released_in_same_year_and_same_artist?
  #   songs = Song.all
  #   songs.each do |song|
  #      song.release_year.to_s.include?(self.release_year.to_s) && song.artist_name == self.artist_name
  #   end
  # end

  ######## refactored solution #############
  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false, scope: [:release_year, :artist_name], message: "cannot be repeated by the same artist in the same year" }
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year  }, if: :released?
  validates :artist_name, presence: true

  ############ learn's solution ############
  # validates :title, presence: true
  # validates :title, uniqueness: {
  #   scope: %i[release_year artist_name],
  #   message: 'cannot be repeated by the same artist in the same year'
  # }
  # validates :released, inclusion: { in: [true, false] }
  # validates :artist_name, presence: true

  # with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end

  # def released?
  #   released
  # end

  ########## micah's solution ##########
  # validates :title, presence: true
  # validates :title, uniqueness: { scope: :release_year} 
  # validates :released, inclusion: {in: [true, false]}
  # validates :artist_name, presence: true
  # validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year}, if: ->{ released }
  
  
end
