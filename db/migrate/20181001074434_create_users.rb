class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image_name
      t.string :department

      t.timestamps null: false
    end
  end
end
