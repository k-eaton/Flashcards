require 'faker'

# 5.times do
#   Deck.create(name: Faker::Lorem.words.join(" "))
# end

30.times do
  Card.create(deck_id: rand(1..10), cardname: Faker::Lorem.word, question: Faker::Lorem.words(5).join(" "), correct_answer: "correct answer", incorrect_answer1: "incorrect 1", incorrect_answer2: "incorrect 2", incorrect_answer3: "incorrect 3")
end
