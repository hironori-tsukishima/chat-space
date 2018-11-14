class CreateUsersGroupsRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups_relations do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
