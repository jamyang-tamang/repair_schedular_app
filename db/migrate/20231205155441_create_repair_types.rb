class CreateRepairTypes < ActiveRecord::Migration[7.1]
 def change
    create_table :repair_types do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :repair_types, :name, unique: true
  end
end
