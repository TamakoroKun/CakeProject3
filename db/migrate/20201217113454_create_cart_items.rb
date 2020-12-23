class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :items_id
      t.integer :customers_id
      t.integer :quentity

      t.timestamps
    end
  end
end
