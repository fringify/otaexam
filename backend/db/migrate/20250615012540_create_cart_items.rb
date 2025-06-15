class CreateCartItems < ActiveRecord::Migration[7.1]
  def up
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :price_in_cents
      
      t.timestamps
    end
  end

  def down
    drop_table :cart_items
  end
end
