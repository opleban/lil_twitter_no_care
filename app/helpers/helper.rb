helpers do

	include Gravatarify::Helper

	def get_user
		User.find_by(username: session[:username])
	end

	def get_my_tweets
		tweets_and_retweets = get_user.tweets + get_user.retweets
    tweets_and_retweets.sort_by!{|entry| entry.created_at}.reverse
	end


  def get_other_users_tweets(username)
    tweets_and_retweets = search_by_username(username).first.tweets + search_by_username(username).first.retweets
    tweets_and_retweets.sort_by!{|entry| entry.created_at}.reverse
  end


	def search_by_username(username)
		User.where(username: username)
	end

end