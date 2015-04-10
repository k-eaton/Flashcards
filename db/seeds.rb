require 'faker'


5.times do

  Deck.create(name: Faker::Lorem.words.join(" "))
end

asdsadsa

10.times do
  Card.create(deck_id: rand(1..5), cardname: Faker::Lorem.word, question: Faker::Lorem.words(5).join(" "), correct_answer: "correct answer", incorrect_answer1: "incorrect 1", incorrect_answer2: "incorrect 2", incorrect_answer3: "incorrect 3")
  new_deck = Deck.create(
    name: Faker::Lorem.word
    )
  10.times do
    new_deck.cards.create(
      cardname:         Faker::Lorem.word,
      question:         Faker::Lorem.sentence,
      correct_answer:   Faker::Lorem.word,
      incorrect_answer1:   Faker::Lorem.word,
      incorrect_answer2:   Faker::Lorem.word,
      incorrect_answer3:   Faker::Lorem.word
      )
  end
