class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

  def clickbait
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")

      errors.add(:clickbait, "That is not a clickbait worthy title. Try again.")
   end
 end 
 end

