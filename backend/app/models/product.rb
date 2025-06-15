class Product < ApplicationRecord

  has_many :rules, class_name: 'ProductPriceRule', inverse_of: :product
end
