class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    User.create!(name: 'Dan Rey Oquindo')
  end
end
