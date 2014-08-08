class User < ActiveRecord::Base

  has_many :tweets
  has_many :retweets

  has_many :relations, foreign_key: 'user_a_id'
  has_many :reverse_relations, class_name: 'Relation', foreign_key: 'user_b_id'

  has_many :followers, through: :relations, source: :user_b, before_add: Proc.new {|user,follower| user.relations.create(user_b: follower)}, before_remove: Proc.new {|user,follower| user.relations.where(user_b:follower, rel_type: 'following of').first.destroy}
  has_many :followings, through: :reverse_relations, source: :user_a, before_add: Proc.new{|user,following| user.reverse_relations.create(user_a: following)}, before_remove: Proc.new {|user,following| user.reverse_relations.where(user_b:follower).first.destroy}

  include BCrypt



  # #When you type in password, you check @password or create a new password for new user.
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
