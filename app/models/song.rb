class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, presence:true, if: :released
    validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}, :if => :released?
    validates :title, uniqueness: {scope: [:release_year], message: 'cannot be repeated by the same artist in the same year'}

    
end
