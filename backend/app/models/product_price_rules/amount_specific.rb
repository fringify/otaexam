module ProductPriceRules
  class AmountSpecific < ProductPriceRule

    def apply(quantity)
      quantity >= minimum ? new_price : price_in_cents
    end

    def minimum
      settings["minimum"]
    end

    def new_price
      settings["new_price"]
    end

    def minimum=(val)
      settings["minimum"] = val
    end

    def new_price=(val)
      settings["new_price"] = val
    end
  end
end