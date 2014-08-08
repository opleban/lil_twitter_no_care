class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.text :content
      t.timestamps
    end
  end
end
