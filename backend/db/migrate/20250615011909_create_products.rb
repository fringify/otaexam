class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code, index: { unique: true }
      t.integer :price_in_cents
      t.timestamps
    end
  end
end
