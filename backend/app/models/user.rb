class User < ApplicationRecord

  def self.default
    self.first || create!(name: 'Dan Rey Oquindo')
  end
end
