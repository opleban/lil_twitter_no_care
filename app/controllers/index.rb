get '/' do
  if current_user
    redirect '/profile'
  else
    @sign_up = params[:sign_up]
    erb :front
  end
end

get '/login' do
  login
  redirect '/profile'
end

post '/users/new' do
  create
  give_token
  redirect '/profile'
end

get '/logout' do
  logout
  redirect '/'
end

get '/profile' do
  @user = get_user
  @retweets = Retweet.where(user_id: @user.id)

  erb :profile
end

get '/search' do
  @results = search_by_username(params[:search_key])
  erb :search_results
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  @username = @user.username
  erb :other_profile
end


post '/tweet/new' do
	get_user.tweets << Tweet.create(params)
	redirect '/profile'
end

#figure out how to change this route...
post '/retweet/:id' do
  tweet = Tweet.find(params[:id])
  retweet = Retweet.create(:tweet_id => tweet.id, :user_id => get_user.id, :content => tweet.content)
  redirect '/profile'
end



