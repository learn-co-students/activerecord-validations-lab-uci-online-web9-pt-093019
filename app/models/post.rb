class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbaity?
        def clickbaity?
            clickbait = [
                /Won't Believe/i,
                /Secret/i,
                /Top \d/i,
                /Guess/i
              ]
            if clickbait.none?{|str| str.match title} 
                errors.add(:title, "must be more clickbaity!")
            end
        end
end
