get '/' do
  erb :index
end

get '/decks/:id/cards' do
  @individual_deck = Deck.find(params[:id])
  @all_cards_in_deck = Card.where(deck_id: @individual_deck.id)
  erb :cards
end

get '/decks/:deck_id/cards/:card_id' do
  @individual_card = Card.find(params[:card_id])
  erb :card
end

get '/decks/:id/cards/new' do
  @new_card = Card.new(card: params[:card])
    if @card.save
      redirect '/decks/:id/cards'
    else
      'Invalid'
      erb :form
    end
end

# get '/decks/:id/cards/:card_id/edit' do



post '/decks/:id/cards' do
end

put '/decks/:id/cards/:id' do #This could possibly be changed to the display deck page rather than requiring a specific card id.
  #This route allows you to update cards.
end

delete '/decks/:id/cards/:id' do
  erb :cards_delete
end

