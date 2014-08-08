def get_user
	User.find_by(username: session[:username])
end

def get_tweets
	get_user.tweets.reverse
end