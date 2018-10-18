class AddMessageThemeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message_theme, :integer
  end
end
