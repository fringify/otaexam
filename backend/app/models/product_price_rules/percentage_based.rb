module ProductPriceRules
  class PercentageBased < ProductPriceRule
    
    def apply(quantity)
      quantity >= minimum ? (price_in_cents * percentage) : price_in_cents
    end

    def minimum
      settings["minimum"]
    end

    def percentage
      settings["percentage"]
    end

    def minimum=(val)
      settings["minimum"] = val
    end

    def percentage=(val)
      settings["percentage"] = val
    end
  end
end