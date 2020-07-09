class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year}
    validates :release_year, presence: true, if: :released

    include ActiveModel::Validations
    validates_with ReleaseYearValidator
end
