class Tweets < ActiveRecord::Migration
  def up
    
    create_table :tweets, :force => true do |t|
      t.integer       :source_id
      t.integer       :tweet_id
      t.string        :text, :limit => 160
      t.text          :data
      t.datetime      :published_at
      t.timestamps
    end
  end

  def down
  end
end