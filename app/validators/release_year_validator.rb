class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.release_year #!!record.release_year
            unless record.release_year <= Date.today.year
                record.errors[:release_year] << "Song released must be today or before today."
            end
        end
    end
end