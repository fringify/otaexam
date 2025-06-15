class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code, index: { unique: true }
      t.integer :price_in_cents
      t.timestamps
    end

    Product.destroy_all
    Product.create!(code: 'GR1', name: 'Green Tea', price_in_cents: '311')
    Product.create!(code: 'SR1', name: 'Strawberries', price_in_cents: '500')
    Product.create!(code: 'CF1', name: 'Coffe', price_in_cents: '1123')
  end
end
