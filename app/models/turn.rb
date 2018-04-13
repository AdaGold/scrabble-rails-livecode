class Turn < ApplicationRecord
  belongs_to :player

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

  def self.highest_scoring
    all.reduce do |best_turn, turn|
      if turn.score > best_turn.score     # New turn has better score
        turn
      elsif best_turn.score > turn.score  # New turn has worse score
        best_turn
      else                                # Scores are tied
        # Tie-breaking logic
        best_len = best_turn.word.length
        turn_len = turn.word.length

        if best_len == 7
          best_turn
        elsif turn_len == 7
          turn
        else
          [best_turn, turn].min_by { |t| t.word.length }
        end
      end
    end
  end
end
