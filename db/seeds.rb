require 'faker'

10.times do |i|
  name = Faker::Name.name
  user_name = name[0..2]
  new_user = User.create(:name => name, :password_hash => Faker::Commerce.color, :email => Faker::Internet.email, :username => user_name )
end

users = User.all.to_a.shuffle

users.each do |user|

  tweet_objects = []
  3.times do
    tweet_objects << Tweet.create(:content => Faker::Lorem.sentence)
  end

  tweet_objects.each do |tweet|
    user.tweets << tweet
  end

end

#assign random retweets to people
users = User.all.to_a
users.shuffle!
users.each do |user|
    Retweet.create(:tweet_id => user.tweets[0].user_id, :content => user.tweets[0].content,  :user_id => user.id)
end






