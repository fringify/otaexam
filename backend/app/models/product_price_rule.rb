class ProductPriceRule < ApplicationRecord

  belongs_to :product
  validates :product_id, uniqueness: { scope: :type }

  scope :buy_x_get_y, -> { where(type: 'ProductPriceRules::BuyXGetY') }
  scope :amount_specific, -> { where(type: 'ProductPriceRules::AmountSpecific') }
  scope :discount_based, -> { where(type: 'ProductPriceRules::PercentageBased') }
  scope :amount_or_discount_based, -> { where(type: ['ProductPriceRules::AmountSpecific', 'ProductPriceRules::PercentageBased'])}

  delegate :price_in_cents, to: :product

end
