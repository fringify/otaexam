FactoryBot.define do
  factory :product do
    sequence(:name) { |x| "Product #{x}"}
    sequence(:code) { |x| "PX#{x}"}
    price_in_cents { 1000 }
  end
end
