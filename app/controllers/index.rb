get '/' do
  unless logged_in?
    @sign_up = params[:sign_up]
    erb :front
  else
    redirect '/profile'
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
	# @user = User.create(username:"dsubl", email:"dsubl@heythere.org", name:"Danielle Sublett")
	# session[:username] = "dsubl"
	# @user.tweets << Tweet.create(content:"Crunch crunch crunch")
  @user = get_user
	erb :profile
end

post '/tweet/new' do
	get_user.tweets << Tweet.create(params)
	redirect '/profile'
end

