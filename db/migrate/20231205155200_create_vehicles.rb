class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
