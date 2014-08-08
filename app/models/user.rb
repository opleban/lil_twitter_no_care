class User < ActiveRecord::Base
  has_many :tweets
  has_many :retweets
  has_and_belongs_to_many :followers, class_name:"User", foreign_key:"followed_id"
  has_and_belongs_to_many :followeds, class_name: "User", foreign_key:"follower_id"
end
