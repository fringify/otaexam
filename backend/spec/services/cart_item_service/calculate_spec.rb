require 'rails_helper'

RSpec.describe CartItemService::Calculate, type: :service do
  describe '#call' do
    subject { described_class.new(cart_item).call }

    context 'product has one discount rule' do
      context 'product has buy X get Y' do
      end

      context 'product is discounted when bulk' do
        context 'discount is percentage based' do
        end

        context 'disocunt is amount specific based' do
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
