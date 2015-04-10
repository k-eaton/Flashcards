require 'faker'

5.times do
  this_deck = Deck.create(name: Faker::Lorem.word)
  10.times do
    this_deck.cards.create(
      question: Faker::Lorem.sentence,
      incorrect_answer1: Faker::Lorem.word,
      incorrect_answer2: Faker::Lorem.word,
      incorrect_answer3: Faker::Lorem.word,
      correct_answer:    Faker::Lorem.word,
      )
  end
end
