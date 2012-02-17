class KeyValues < ActiveRecord::Migration
  def up
    
    create_table :stores, :force => true do |t|
      t.string        :key
      t.text          :data
      t.timestamps
    end
    
    add_index :stores, :key
  end

  def down
  end
end