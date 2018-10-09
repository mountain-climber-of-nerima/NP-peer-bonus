class RenameReceiUserNameColumnToMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :recei_user_name, :receive_user_name
  end
end
