class AddPlayerIdToTurns < ActiveRecord::Migration[5.1]
  def change
    add_reference :turns, :player, foreign_key: true
  end
end
