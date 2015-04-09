class Deck < ActiveRecord::Migration
  def change
    create_table :decks |t|
    t.string :name
    t.timestamps
  end
end
