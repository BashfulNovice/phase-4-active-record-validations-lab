class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
    
        if self.title
            return errors.add(:title, "no one is going to read this...") unless (self.title.include? "Won't Believe") || (self.title.include? "Secret") || (self.title.include? "Guess") || (self.title.include? "Top")
        end
    end
end
