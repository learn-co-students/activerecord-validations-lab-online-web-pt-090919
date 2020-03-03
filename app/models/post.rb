class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
  message: "%{value} must be Fiction or Non-Fiction" }
  validate :non_clickbait
  
  def non_clickbait
    unless title && title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:non_clickbait, "Title not clickbaitey enough!")
    end
  end
  
  
  
end