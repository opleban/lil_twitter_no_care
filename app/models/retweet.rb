class Retweet < ActiveRecord::Base
  validates :content, length: {maximum: 140, message: "You entered too many characters. Max of 140."}
  belongs_to :user
  belongs_to :tweet

end
