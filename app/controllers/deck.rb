get '/decks' do
  @decks = Deck.all.order("id ASC")
  erb :'decks/decks'
end

get '/decks/new' do
  erb :'decks/new'
end

post '/decks' do
  @new_deck = Deck.new(name: params[:name])
  if @new_deck.save
    @new_id = @new_deck.id.to_s
    redirect '/decks/'+@new_id+'/cards/new'
  else
    status 500
    "Denied!  (Your new deck does not exist)"
  end
end

get '/decks/:id' do
  @deck = Deck.where(id: params[:id]).first
  @cards = Card.where(deck_id: params[:id])
  erb :'decks/deck'
end

get '/decks/:id/edit' do
  @deck = Deck.where(id: params[:id]).first
  @cards = Card.where(deck_id: params[:id])
  erb :'decks/edit'
end

put '/decks/:id' do
  deck = Deck.where(id: params[:id]).first
  deck.update(name: params[:deck_name])
  redirect '/decks/'+deck.id.to_s
end

get '/decks/:id/delete' do
  @to_be_deleted = Deck.where(id: params[:id]).first
  @to_be_deleted.delete
  @cards_to_be_deleted = Card.where(deck_id: params[:id])
  @cards_to_be_deleted.each {|card| card.delete}
  redirect '/decks'
end
