class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :tile_tray, null: false, default: ''

      t.timestamps
    end
  end
end
