require 'rails_helper'

RSpec.describe CartItemService::Calculate, type: :service do
  describe '#call' do
    subject { described_class.new(cart_item).call }

    context 'product has one discount rule' do
      context 'product has buy X get Y' do
        let(:product) { create(:product, name: 'Green Tea', price_in_cents: 311) }
        let(:cart_item) { create(:cart_item, product: product, quantity: 21) }

        before do
          create(:buy_x_get_y_rule, buy_count: buy_count, free_count: free_count, product: product)
        end

        context 'buy 1 get 1' do
          let(:buy_count) { 1 }
          let(:free_count) { 1 }

          it 'should return expected amount' do
            # 21 products, 10 free . 11 x 311 
            expect(subject.call).to eq(3421)
          end
        end

        context 'buy 2 get 1' do
          let(:buy_count) { 2 }
          let(:free_count) { 1 }

          it 'should return expected amount' do
            # 21 products, 7 free. 14 x 311
            expect(subject.call).to eq(4354)
          end
        end

        context 'buy 3 get 2' do
          let(:buy_count) { 3 }
          let(:free_count) { 2 }

          it 'should return expected amount' do
            # 21 products, 8 free. 13 x 311
            expect(subject.call).to eq(4043)
          end
        end

        context 'buy 10 get 2' do
          let(:buy_count) { 10 }
          let(:free_count) { 2 }

          it 'should return expected amount' do
            # 21 products, 2 free. 19 x 311
            expect(subject.call).to eq(5909)
          end
        end
      end

      context 'product is discounted when bulk' do

        context 'discount is amount specific' do
          let(:product) { create(:product, name: 'Straweberry', price_in_cents: 500) }
          let(:cart_item) { create(:cart_item, product: product, quantity: quantity) }
  
          before do
            create(:amount_specific_rule, minimum: 5, new_price: 400, product: product)
          end

          context 'quantity is below minimum' do
            let(:quantity) { 3 }

            it 'should return expected amount' do
              # 3 products, no discount. 3 x 500
              expect(subject.call).to eq(1500)
            end
          end

          context 'quantity is above minimum' do
            let(:quantity) { 7 }

            it 'should return expected amount' do
              # 7 products, should use new price. 7 x 400
              expect(subject.call).to eq(2800)
            end
          end
        end

        context 'discount is percentage based' do
          let(:product) { create(:product, name: 'Coffee', price_in_cents: 500) }
          let(:cart_item) { create(:cart_item, product: product, quantity: quantity) }
  
          before do
            create(:percentage_based_rule, minimum: 5, percentage: 0.66, product: product)
          end

          context 'quantity is below minimum' do
            let(:quantity) { 3 }

            it 'should return expected amount' do
              # 3 products, no discount. 3 x 500
              expect(subject.call).to eq(1500)
            end
          end

          context 'quantity is above minimum' do
            let(:quantity) { 7 }

            it 'should return expected amount' do
              # 7 products, should use (7 x 500) * 0.66
              expect(subject.call).to eq(2310)
            end
          end
        end
      end


    end

    context 'product has multiple discount rule' do
      context 'combination of buy X get Y and percentage based' do
      end

      context 'combination of buy X get Y and amount specific' do
      end
    end
  end
end
