module ProductPriceRules
  class BuyXGetY < ProductPriceRule

    def buy_count
      settings[:buy_count]
    end

    def free_count
      settings[:free_count]
    end

    def buy_count=(val)
      settings[:buy_count] = val
    end

    def free_count=(val)
      settings[:free_count] = val
    end
  end
end