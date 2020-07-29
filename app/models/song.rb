class Song < ActiveRecord::Base
   validates :title, presence: true
   validates :release_year, presence: true, if: :released?
   validate  :future
   validate :same_song
   def future
     if release_year.present? && release_year > Date.today.year
       errors.add(:release_year, "future")
     end
   end

   def same_song
     if Song.any? {|song| song.title == title && song.artist_name == artist_name && song.release_year == release_year}
    errors.add(:title, "same song")
end
   end

end
