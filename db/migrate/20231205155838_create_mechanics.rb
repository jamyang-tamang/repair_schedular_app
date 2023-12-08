class CreateMechanics < ActiveRecord::Migration[7.1]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.references :repair_type, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
