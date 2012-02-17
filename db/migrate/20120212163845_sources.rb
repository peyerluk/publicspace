class Sources < ActiveRecord::Migration
  def up
    
    create_table :sources, :force => true do |t|
      t.string      :origin
      t.string      :identifier
      t.string      :crawler
      t.text        :data
      t.datetime    :last_visit
      t.datetime    :next_visit
      t.boolean     :active, :default => true
      t.string      :type
      t.timestamps
    end
    
  end

  def down
  end
end