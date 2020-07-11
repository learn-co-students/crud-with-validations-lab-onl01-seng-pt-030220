class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year, message: "should only happen once per year"}
    validates :released, inclusion: { in: [true, false] }
    with_options if: :released do |released|
        released.validates :release_year, presence: true
        released.validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
    end
    validates :artist_name, presence: true
    
end
