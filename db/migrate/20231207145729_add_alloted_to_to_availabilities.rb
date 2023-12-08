class AddAllotedToToAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_column :availabilities, :alloted_to, :id
  end
end
