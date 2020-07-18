class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    
    with_options if: (:released == false) do |song| 
        song.validates :release_year, presence: false
        song.validates :release_year, presence: true, if:-> {released.present?}
        validates :release_year, numericality: { less_than_or_equal_to:  Date.current.year  }
    end

end
