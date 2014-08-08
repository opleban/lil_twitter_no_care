helpers do
	def get_user
		User.find_by(username: session[:username])
	end

	def get_tweets
		tweets_and_retweets = get_user.tweets + get_user.retweets
    tweets_and_retweets.sort_by!{|entry| entry.created_at}.reverse
	end


	def search_by_username(username)
		User.where(username:username)
	end
end