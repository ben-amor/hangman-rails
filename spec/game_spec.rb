require 'rails_helper'

RSpec.describe Game do
  context 'when a letter which has already been guessed is guessed' do
    subject(:game) { described_class.new }
    before do
      game.guesses = ['a']
      game.most_recent_guess = 'a'
      game.valid? # Forces validation to occur and (as something of a side effect) populates errors collection
    end

    it 'is invalid' do
      expect(game).not_to be_valid
    end

    it 'reports a meaningful error' do
      expect(game.errors[:most_recent_guess].any?{ |message| message.include?('already guessed') }).to be_truthy
    end
  end
end