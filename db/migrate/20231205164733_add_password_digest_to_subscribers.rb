class AddPasswordDigestToSubscribers < ActiveRecord::Migration[7.1]
  def change
    add_column :subscribers, :password_digest, :string
  end
end
