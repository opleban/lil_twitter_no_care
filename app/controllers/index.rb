get '/' do
	erb :index
end

get '/profile' do
	# @user = get_user
	@user = User.create(username:"dsubl", email:"dsubl@heythere.org", name:"Danielle Sublett")
	session[:username] = "dsubl"
	@user.tweets << Tweet.create(content:"Crunch crunch crunch")
	erb :profile
end

post '/tweet/new' do
	get_user.tweets << Tweet.create(params)
	redirect '/profile'
end
