class Song < ApplicationRecord
    
    validates :title, presence:true, uniqueness:true
    # validates :release_year, presence:true, if: :valid_year?, unless: Proc.new{|a|a.released? == false} 

    def valid_year?
    if self.release_year.to_i < Date.today.year
        true 
    else
        false 
    end
    end 

        with_options if: :released? do |song|
        song.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year }
        song.validates :release_year, presence: true
      end

      def released? 
        self.released
      end


end 
