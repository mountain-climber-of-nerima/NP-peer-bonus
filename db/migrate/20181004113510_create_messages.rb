class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :send_id
      t.string :anonymous_flag
      t.integer :receive_id
      t.string :stamp
      t.string :message_theme
      t.text :message_content
      t.string :message_unread_flag

      t.timestamps null: false
    end
  end
end
