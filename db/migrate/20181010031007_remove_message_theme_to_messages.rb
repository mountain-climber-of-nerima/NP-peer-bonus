class RemoveMessageThemeToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :message_theme
  end
end
