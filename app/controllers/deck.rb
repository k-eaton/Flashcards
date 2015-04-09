get '/decks' do
  @decks = Deck.all
  erb :'decks/decks'
end

get '/decks/:id' do
  @deck = Deck.where(id: params[:id]).first
  @cards = Card.where(deck_id: params[:id])
  erb :'decks/deck'
end

get '/decks/new' do

  erb :'decks/new'
end

post '/decks' do
  redirect '/decks/cards/new'
end

get '/decks/:id/edit' do
  erb :'decks/edit'
end

put '/decks/:id' do
  redirect '/decks/:id'
end

get '/decks/:id/delete' do
  erb :'decks/delete'
end

delete '/decks/:id' do
  redirect '/decks'
end
