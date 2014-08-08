class User < ActiveRecord::Base
  include BCrypt
	has_many :tweets

  # #When you type in password, you check @password or create a new password for new user.
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
