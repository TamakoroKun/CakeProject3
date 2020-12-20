class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
