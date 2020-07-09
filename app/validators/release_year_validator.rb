class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)

        if !!record.release_year
            unless record.release_year <= Date.today.year
                record.errors[:release_year] << "Song released can not be after today's date."
            end
        end
    end
end