class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validate :release_year_with_released
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, if: :released?
    

  def release_year_with_released
    if released == true && release_year.nil?
      errors.add(:release_year, "can't be in the empty")
    end 
  end
  
end
