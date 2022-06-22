class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :introduction, null: false
      t.string :room_image, null: false
      t.integer :price, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
