class Post < ActiveRecord::Base
    validates :title, presence: true # All posts have a title
    validates :content, length: { minimum: 250 } # Post content is at least 250 characters long
    validates :summary, length: { maximum: 250 } # Post summary is a maximum of 250 characters
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) } # Post category is either Fiction or Non-Fiction requires an inclusion validator
    validate :clickbait

    def clickbait 
        if self.title != nil
            
        end
    end
end
