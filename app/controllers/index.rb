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