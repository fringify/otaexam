class User < ApplicationRecord

  has_one :cart, dependent: :destroy
  
  def self.default
    self.first || create!(name: 'Dan Rey Oquindo')
  end

  def load_cart
    cart.present? ? cart : create_cart
  end
end
