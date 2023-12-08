class CreateRepairs < ActiveRecord::Migration[7.1]
  def change
    create_table :repairs do |t|
      t.references :mechanic, null: false, foreign_key: true
      t.references :repair_type, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.datetime :scheduled_at
      t.integer :duration

      t.timestamps
    end
  end
end


  
  
  

 
 

 

  