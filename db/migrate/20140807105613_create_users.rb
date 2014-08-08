class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :username
      t.references :followed
      t.references :follower
      t.timestamps
    end
  end
end
