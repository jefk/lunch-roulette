class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
