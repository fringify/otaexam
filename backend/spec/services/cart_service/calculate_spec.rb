require 'rails_helper'

RSpec.describe CartService::Calculate, type: :service do
  describe '#call' do
    subject { described_class.new(cart).call }

    let!(:cart) { create(:cart) }

    let!(:product1) { create(:product, name: 'Green Tea', price_in_cents: 311) }
    let!(:product2) { create(:product, name: 'Strawberry', price_in_cents: 500) }
    let!(:product3) { create(:product, name: 'Coffee', price_in_cents: 1123) }

    let!(:rule1) { create(:buy_x_get_y_rule, buy_count: 1, free_count: 1, product: product1) }
    let!(:rule2) { create(:amount_specific_rule, minimum: 3, new_price: 450, product: product2) }
    let!(:rule3) { create(:percentage_based_rule, minimum: 3, percentage: 2.0/3, product: product3) }


    shared_examples 'calculates correctly' do
      it { expect(subject).to eq(expected_amount)}
    end

    context 'scenario1' do
      let!(:item1) { create(:cart_item, cart: cart, product: product1, quantity: 3) }
      let!(:item2) { create(:cart_item, cart: cart, product: product2, quantity: 1) }
      let!(:item3) { create(:cart_item, cart: cart, product: product3, quantity: 1) }
      let(:expected_amount) { 22.45 }

      it_behaves_like 'calculates correctly'
    end

    context 'scenario2' do
      let!(:item1) { create(:cart_item, cart: cart, product: product1, quantity: 2) }
      let(:expected_amount) { 3.11 }

      it_behaves_like 'calculates correctly'
    end

    context 'scenario3' do
      let!(:item1) { create(:cart_item, cart: cart, product: product1, quantity: 1) }
      let!(:item2) { create(:cart_item, cart: cart, product: product2, quantity: 3) }
      let(:expected_amount) { 16.61 }

      it_behaves_like 'calculates correctly'
    end

    context 'scenario4' do
      let!(:item1) { create(:cart_item, cart: cart, product: product1, quantity: 1) }
      let!(:item2) { create(:cart_item, cart: cart, product: product2, quantity: 1) }
      let!(:item3) { create(:cart_item, cart: cart, product: product3, quantity: 3) }
      let(:expected_amount) { 30.57 }

      it_behaves_like 'calculates correctly'
    end

  end

end