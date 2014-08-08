class Relation < ActiveRecord::Base
  belongs_to :user_b, class_name: "User"
  belongs_to :user_a, class_name: "User"
end

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
