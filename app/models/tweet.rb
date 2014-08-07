class Tweet < ActiveRecord::Base
	belongs_to :user
	has_many :tweets
  # Remember to create a migration!
end
