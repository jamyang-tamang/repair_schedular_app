class AddEmailToSubscribers < ActiveRecord::Migration[7.1]
  def change
    add_column :subscribers, :email, :string
  end
end
