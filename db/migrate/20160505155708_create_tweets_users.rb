class CreateTweetsUsers < ActiveRecord::Migration
  def change
    create_table :tweets_users do |t|
      t.belongs_to :tweet
      t.belongs_to :user

      t.timestamps
    end
  end
end
