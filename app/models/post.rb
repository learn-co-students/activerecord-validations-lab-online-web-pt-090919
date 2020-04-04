class Post < ActiveRecord::Base
    validates :title, presence: true # All posts have a title
    validates :content, length: { minimum: 250 } # Post content is at least 250 characters long
    validates :summary, length: { maximum: 250 } # Post summary is a maximum of 250 characters
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) } # Post category is either Fiction or Non-Fiction requires an inclusion validator
    validate :clickbait

    def clickbait 
        if self.title != nil
            self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess") ? true : errors.add(:title, "must be clickbait")
        end
    end
end

# - Post content is at least 250 characters long
# - Post summary is a maximum of 250 characters
# - Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README Lesson.
#   You'll need to refer to the Rails Guide to look up how to use it.
