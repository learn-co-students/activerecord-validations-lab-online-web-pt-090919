class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
  message: "%{value} is not a valid category" }
  validate :must_be_clickbait

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]
  def must_be_clickbait
    if title && CLICKBAIT.none? {|c| title.include?(c)}
      errors.add(:title, "must be clickbait")
    end
  end
end
