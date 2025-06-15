class ProductPriceRule < ApplicationRecord
  belongs_to :product
  validates :product_id, uniqueness: { scope: :type }
  
end
