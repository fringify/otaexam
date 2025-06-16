Cart.destroy_all
User.destroy_all

User.create!(name: 'Dan Rey Oquindo')

Product.destroy_all
gr1 = Product.create!(code: 'GR1', name: 'Green Tea', price_in_cents: 311)
sr1 = Product.create!(code: 'SR1', name: 'Strawberries', price_in_cents: 500)
cf1 = Product.create!(code: 'CF1', name: 'Coffe', price_in_cents: 1123)

ProductPriceRule.destroy_all
ProductPriceRules::BuyXGetY.create(product: gr1, buy_count: 1, free_count: 1)
ProductPriceRules::AmountSpecific.create(product: sr1, minimum: 3, new_price: 450)
ProductPriceRules::PercentageBased.create(product: cf1, minimum: 3, percentage: 2.0/3)