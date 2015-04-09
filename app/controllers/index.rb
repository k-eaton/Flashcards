get '/' do
  erb :index
end

get '/decks/:id/cards' do
  @all_decks = Deck.all
  erb :deck
end

get '/decks/:id/cards/:id' do
  @individual_card = Card.where(id: params[:id]).first
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

post '/decks/:id/cards' do
end

put '/decks/:id/cards/:id' do #This could possibly be changed to the display deck page rather than requiring a specific card id.
  #This route allows you to update cards.
end

delete '/decks/:id/cards/:id' do
  erb :cards_delete
end

