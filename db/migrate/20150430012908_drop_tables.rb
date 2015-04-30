class DropTables < ActiveRecord::Migration
  def up
    drop_table 'items'
    drop_table 'item_tags'
    drop_table 'tags'
  end

  def down
  end
end
