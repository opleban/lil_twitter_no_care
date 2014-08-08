class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :retweets

	belongs_to :user

end
