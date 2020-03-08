class TitleValidator < ActiveModel::Validator 

    def validate(record)
        if record.title
            unless record.title.include?("Won't Believe") ||
                    record.title.include?("Secret") ||
                    record.title.include?("Top 10") ||
                    record.title.include?("Guess")
                record.errors[:title] << 'Title is not clickbaity'
            end
        else
            record.errors[:title] << 'Title is missing'
        end
    end
end