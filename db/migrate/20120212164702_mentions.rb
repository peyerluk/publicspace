class Mentions < ActiveRecord::Migration
  def up
    
    create_table :mentions, :force => true do |t|
      t.integer       :source_id
      t.integer       :origin_id
      t.string        :origin_type
      t.integer       :mentioned_source_id
      t.integer       :mentioned_article_id
      t.string        :mentioned_url
      t.text          :data
      t.timestamps
    end
  end

  def down
  end
end