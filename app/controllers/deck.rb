get '/decks' do
  @decks = Deck.all
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

  end
end

get '/decks/:id' do
  @deck = Deck.where(id: params[:id]).first
  @cards = Card.where(deck_id: params[:id])
  erb :'decks/deck'
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
