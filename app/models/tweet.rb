class Tweet < ActiveRecord::Base
  validates :content, length: {maximum: 140, message: "You entered too many characters. Max of 140."}
  belongs_to :user
  has_many :retweets

  def self.create_tweet(params)
    begin
    self.create!(params)
    rescue Exception => e
      false
    end
  end

end
