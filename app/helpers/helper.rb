helpers do

	include Gravatarify::Helper

	def get_user
		User.find_by(username: session[:username])
	end

  def get_tweets
    p get_user.tweets
    get_user.tweets.reverse
  end

	def search_by_username(username)
		User.where(username:username)
	end
end
