class User < ActiveRecord::Base
  has_many :tweets
  has_many :retweets

  has_many :relations, foreign_key: 'user_a_id'
  has_many :reverse_relations, class_name: 'Relation', foreign_key: 'user_b_id'

  has_many :followers, through: :relations, source: :user_b, before_add: Proc.new {|user,follower| user.relations.create(user_b: follower)}, before_remove: Proc.new {|user,follower| user.relations.where(user_b:follower, rel_type: 'following of').first.destroy}

  has_many :followings, through: :reverse_relations, source: :user_a, before_add: Proc.new{|user,following| user.reverse_relations.create(user_a: following)}, before_remove: Proc.new {|user,following| user.reverse_relations.where(user_b:follower).first.destroy}
end

  # has_many :followers, through: :relations, source: 'user_b', conditions: {'relations.rel_type' => 'following of'}, before_add: Proc.new {|user,follower| user.relations.create(user_b: follower, rel_type: 'following of')}, before_remove: Proc.new {|user,follower| user.relations.where(user_b:follower, rel_type: 'following of').first.destroy}

  # has_many :followings, through: :reverse_relations, source: 'user_a', conditions: {'relations.rel_type' => 'following of'}, before_add: Proc.new{|user,following| user.reverse_relations.create(user_a: following, rel_type: 'following of')}, before_remove: Proc.new {|user,following| user.reverse_relations.where(user_b:follower, rel_type: 'following of').first.destroy}
#OPTION1
# class Employee < ActiveRecord::Base
#   has_many :relations, foreign_key: 'employee_a_id'
#   has_many :reverse_relations, class_name: 'Relation', foreign_key: 'employee_b_id'

#   has_many :subordinates,
#            through: :relations,
#            source: 'employee_b',
#            conditions: {'relations.rel_type' => 'manager of'}
#            :before_add => Proc.new { |employe,subordinate| employe.relations.create(employe_b: subordinate, rel_type: 'manager of') },
#            :before_remove => Proc.new { |employe,subordinate| employe.relations.where(employe_b: subordinate, rel_type: 'manager of').first.destroy }

#   has_many :managers,
#            through: :reverse_relations,
#            source: 'employee_a',
#            conditions: {'relations.rel_type' => 'manager of'}
#            :before_add => Proc.new { |employe,manager| employe.reverse_relations.create(employe_a: manager, rel_type: 'manager of') },
#            :before_remove => Proc.new { |employe,manager| employe.reverse_relations.where(employe_b: subordinate, rel_type: 'manager of').first.destroy }
#end

  #OPTION2
  # has_many :follower_relations, class_name: "FollowerRelation", foreign_key: :followed_id
  # has_many :followed_relations, class_name: "FollowerRelation", foreign_key: :follower_id
  # has_many :followers, source: :follower, through: :follower_relations
  # has_many :followeds, source: :followed, through: :followed_relations
#OPTION 2 Didn't work
# class ManagerRelation < ActiveRecord::Base
#   belongs_to :manager, :class_name => 'Employee'
#   belongs_to :subordinate, :class_name => 'Employee'
# end

# class Employee < ActiveRecord::Base
#   has_many :manager_relations,     :class_name => "ManagerRelation",
#                :foreign_key => :subordinate_id
#   has_many :subordinate_relations, :class_name => "ManagerRelation",
#                :foreign_key => :manager_id

#   has_many :managers,     :source => :manager,
#                :through => :manager_relations

#   has_many :subordinates, :source => :subordinate,
#                :through => :subordinate_relations
# end
