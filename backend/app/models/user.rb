class User < ApplicationRecord

  has_one :cart
  
  def self.default
    self.first || create!(name: 'Dan Rey Oquindo')
  end
end
