class CreateSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.references :vehicle, null: true, foreign_key: true

      t.timestamps
    end
  end
end
