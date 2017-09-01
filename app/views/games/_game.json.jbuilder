json.extract! game, :id, :word_to_be_guessed, :guesses, :created_at, :updated_at
json.url game_url(game, format: :json)
