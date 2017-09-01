class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :word_to_be_guessed
      t.string :guesses

      t.timestamps
    end
  end
end
