  # #authenticating a user
helpers do
  def login
    @user = User.find_by(username:params[:username])
    if @user.password == params[:password]
      give_token
    else
      redirect '/login'
    end
  end

  def give_token
    session[:username] = @user.username
  end

  def logged_in?
    session[:username] ? true : false
  end

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
    if session[:email]
      User.find_by(email: session[:email])
    else
      false
    end
  end
  
end