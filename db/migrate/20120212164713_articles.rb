class Articles < ActiveRecord::Migration
  def up
    
    create_table :articles, :force => true do |t|
      t.integer       :source_id
      t.string        :crawler
      t.integer       :tweets
      t.integer       :facebook_shares
      t.integer       :google_plus
      t.integer       :bookmarks
      t.integer       :comments
      t.string        :title
      t.text          :text
      t.text          :content_data
      t.datetime      :published_at
      t.datetime      :last_visit
      t.datetime      :next_visit
      t.timestamps
    end
  end

  def down
  end
end