class Player < ApplicationRecord
  has_many :turns

  def play!(word)
    unless word.is_a?(String) && (1..7).include?(word.length)
      raise ArgumentError.new('Invalid word')
    end

    # play a word using the tiles in the tray
    new_tray = tile_tray.chars.dup
    word.chars.each do |letter|
      index = new_tray.index(letter)
      raise ArgumentError.new("Tile tray missing letter #{letter}") unless index

      new_tray.delete_at(index)
    end

    # a new word a Turn instance is created and added to the history of turns
    new_turn = turns.create(word: word)

    self.tile_tray = new_tray.join
    save!

    return new_turn
  end
end
