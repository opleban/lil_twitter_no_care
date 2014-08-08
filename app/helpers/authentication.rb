  # #authenticating a user
helpers do
  def login
    @user = User.find_by(username:params[:username])
    if @user && @user.password == params[:password]
      give_token
    else
      redirect '/?error=true'
    end
  end

  def give_token
    session[:username] = @user.username
  end

  # def logged_in?
  #   session[:username] ? true : false
  # end

    # #creating a new user
  def create
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
  end

  def logout
    session.delete(:username)
  end

  def current_user
    if session[:username]
      User.find_by(username: session[:username])
    else
      false
    end
  end
  
end