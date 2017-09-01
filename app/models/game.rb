class Game < ApplicationRecord
  validates :most_recent_guess,
            presence: true, if: proc { |c| !c.guesses.blank? }, # TODO: this is horrible - intent is to only validate for games already in progress and guesses being blank is at best coincidentally true when this is a new game
            format: { with: /([A-Za-z])/, message: 'You can only guess alphabetic characters' }
  validate :already_guessed

  attr_accessor :most_recent_guess # TODO: it feels a bit wrong to have this transient property on Game at all. Is it?

  # TODO would prefer to validate with a custom validator but couldn't get one to work ' could not find such file ' and so forth
  def already_guessed
    errors.add(:most_recent_guess, "You've already guessed #{most_recent_guess}") if guesses.include? most_recent_guess
  end
end
