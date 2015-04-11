class AddUniqueIndexToTags < ActiveRecord::Migration
  def change
    remove_index :tags, :name
    add_index :tags, :name, unique: true
  end
end
