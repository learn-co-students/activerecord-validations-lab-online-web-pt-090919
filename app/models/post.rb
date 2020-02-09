class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :must_be_clickbait
  
  def must_be_clickbait
    unless self.title && self.title.include?("You Won't Believe")
      errors.add(:title, "must be clickbait")
    end
  end
  
end
