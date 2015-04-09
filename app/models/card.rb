class Card < ActiveRecord::Base
    belongs_to :deck, index :true
end
