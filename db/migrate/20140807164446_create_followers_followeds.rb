class CreateFollowersFolloweds < ActiveRecord::Migration
  def change
    create_table :followers_followeds do |t|
      t.references :follower_id
      t.references :followed_id
      t.timestamps
    end
  end
end
