class CreateItemTags < ActiveRecord::Migration
  def change
    create_table :item_tags do |t|
      t.belongs_to :item, index: true
      t.belongs_to :tag, index: true

      t.timestamps null: false
    end
  end
end
