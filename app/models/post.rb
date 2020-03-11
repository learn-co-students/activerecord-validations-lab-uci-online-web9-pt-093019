class Post < ActiveRecord::Base
    

    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w"Fiction Non-Fiction"}

    validate :title_must_be_clickbait 

    def title_must_be_clickbait
        if title
            unless title.match(/(Won't Believe)|(Secret)|(Top)|(Guess)/)
                errors.add(:title, "Must be clickbait.")
            end
        end  
    end 
 #   include ActiveModel::Validations
 #   validates_with TitleValidator 
end
