module GamesHelper
  def clue(game)
    clue_string = game.word_to_be_guessed.chars
                      .map { |char| game.guesses.include?(char) ? char : '_' }
                      .join
    word_length = game.word_to_be_guessed.size
    "#{clue_string} (#{word_length} letters)"
  end

  def guesses_for_display(game)
    game.guesses.chars.join(',')
  end
end
