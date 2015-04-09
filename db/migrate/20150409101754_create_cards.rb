class CreateCards < ActiveRecord::Migration
    def change
      create_table :cards do |t|
      t.belongs_to :deck, index :true
      t.string :cardname
      t.string :question
      t.string :correct_answer
      t.string :incorrect_answer1
      t.string :incorrect_answer2
      t.string :incorrect_answer3
      t.timestamps
    end
  end
end
