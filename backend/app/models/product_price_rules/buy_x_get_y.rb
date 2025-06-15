module ProductPriceRules
  class BuyXGetY < ProductPriceRule

    def chargeable_items_count(quantity)
      sets = quantity / (buy_count + free_count)
      remainder = quantity % (buy_count + free_count)
      (sets * buy_count) + remainder
    end

    def buy_count
      settings["buy_count"]
    end

    def free_count
      settings["free_count"]
    end

    def buy_count=(val)
      settings["buy_count"] = val
    end

    def free_count=(val)
      settings["free_count"] = val
    end
  end
end