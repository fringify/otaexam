class CreateProductPriceRules < ActiveRecord::Migration[7.1]
  def change
    create_table :product_price_rules do |t|
      t.references :product
      t.string :type 
      t.jsonb :settings, default: {}

      t.timestamps
    end
  end
end
