class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamp :created_at
      t.timestamp :updated
      t.boolean :is_active

      t.timestamps
    end
  end
end