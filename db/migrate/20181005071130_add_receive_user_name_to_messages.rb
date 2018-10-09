class AddReceiveUserNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :receive_user_name, :string
  end
end
