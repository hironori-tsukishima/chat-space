class Group < ApplicationRecord

  has_many :users , through: :users_groups_relations
  has_many :users_groups_relations
  has_many :messages
end
