module ProductPriceRules
  class PercentageBased < ProductPriceRule
    
    def minimum
      settings[:minimum]
    end

    def percentage
      settings[:percentage]
    end

    def minimum=(val)
      settings[:minimum] = val
    end

    def percentage=(val)
      settings[:percentage] = val
    end
  end
end