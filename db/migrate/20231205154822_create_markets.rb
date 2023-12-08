class CreateMarkets < ActiveRecord::Migration[7.1]
  def change
    create_table :markets do |t|
      t.text :name

      t.timestamps
    end
  end
end
