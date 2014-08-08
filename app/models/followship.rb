class Followship < ActiveRecord::Base
  
  def connect
    @conn = PG.connect(
      :dbname => DB_NAME,
      :username => db.user,
      :password => db.password)
    @conn
  end

  query

	def self.prepare_insert_followship_statement
	  @conn.prepare("insert_followship", "insert into followship (follower_id, leader_id) values ($1, $2)")
	end

	def self.create(follower, leader)
    @conn.exec_prepared("insert_followship", [follower.id, leader.id])
  end

  def self.prepare_find_leaders_statement
  	@conn.prepare("find_leaders", "SELECT * FROM followship WHERE follower_id =(follower_id) values ($1)")
  end

  def self.find_leaders(user)
    @conn.exec_prepared("find_leaders", [user.id])
  end

  def self.prepare_find_followers_statement
  	@conn.prepare("find_followers", "SELECT * FROM followship WHERE leader_id =(leader_id) values ($1)")
  end

  def self.find_followers(user)
    @conn.exec_prepared("find_followers", [user.id])
  end



  def queryUserTable
    @conn.exec( "SELECT * FROM users" ) do |result|
      result.each do |row|
        yield row if block_given?
      end
    end
  end

end
