class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations, force: true do |t|
      t.references :user_a
      t.references :user_b
    end
  end
end
