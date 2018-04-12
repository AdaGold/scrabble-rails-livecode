class Turn < ApplicationRecord

  LETTER_SCORES = {
    'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2, 'E' =>  1, 'F' => 4,
    'G' => 2, 'H' => 4, 'I' => 1, 'J' => 8, 'K' =>  5, 'L' => 1,
    'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3, 'Q' => 10, 'R' => 1,
    'S' => 1, 'T' => 1, 'U' => 1, 'V' => 4, 'W' =>  4, 'X' => 8,
    'Y' => 4, 'Z' => 10
  }

  def score
    return nil if word.blank? || word.length > 7

    scores = word.chars.map { |letter| LETTER_SCORES[letter] }
    return nil if scores.any?(&:nil?)

    if word.length == 7
      scores.sum + 50
    else
      scores.sum
    end
  end
end
