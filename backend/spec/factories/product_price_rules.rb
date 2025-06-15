FactoryBot.define do
  factory :product_price_rule do
    association :product
    
    factory :buy_x_get_y_rule, class: 'ProductPriceRules::BuyXGetY' do
    end

    factory :percentage_based_rule, class: 'ProductPriceRules::PercentageBased' do
    end

    factory :amount_specific_rule, class: 'ProductPriceRules::AmountSpecific' do
    end
  end
end
