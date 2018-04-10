class CreateTurns < ActiveRecord::Migration[5.1]
  def change
    create_table :turns do |t|
      t.string :word

      t.timestamps
    end
  end
end
