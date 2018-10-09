class AddSendUserNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :send_user_name, :string
  end
end
