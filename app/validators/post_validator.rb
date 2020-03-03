class PostValidator < ActiveModel::Validator
  def non_clickbait(record)
    unless record.title.match?("Won't Believe") || record.title.match?("Secret") || record.title.match?("Top [number]") || record.title.match?("Guess")
      errors.add(:title, "Title not clickbaitey enough!")
    end
  end
end