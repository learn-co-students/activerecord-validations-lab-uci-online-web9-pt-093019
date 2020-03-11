class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.match(/(Won't Believe)|(Secret)|(Top)|(Guess)/)
            record.errors[:title] << "Make it clickbait, this is not clickbait"
        end 
    end 
end 
