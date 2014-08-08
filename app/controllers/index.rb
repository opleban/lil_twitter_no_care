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
	erb :profile
end

get '/search' do
  @results = search_by_username(params[:search_key])
  erb :search_results
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  erb :other_profile
end

get '/users/:id/followers' do
  @user = User.find(params[:id])
  erb :followers
end

get '/users/:id/followings' do
  @user = User.find(params[:id])
  erb :followings
end

get '/users/:id/relation' do #I know this should be a post but out of time
  @user = User.find(params[:id])
  @user.followers << User.find_by(username: session[:username])
  redirect '/users/#{current_user.id}/followings'
end

post '/tweet/new' do
  if !Tweet.create_tweet(params)
    redirect '/profile?error=true'
  else
    get_user.tweets << Tweet.create_tweet(params)
    redirect '/profile'
  end
end

