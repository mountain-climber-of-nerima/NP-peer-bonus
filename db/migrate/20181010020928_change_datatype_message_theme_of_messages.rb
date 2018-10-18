class ChangeDatatypeMessageThemeOfMessages < ActiveRecord::Migration
  def change
    change_column :messages, :message_theme, 'integer USING CAST(message_theme AS integer)'
  end
end
