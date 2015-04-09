get '/decks' do
  erb :'decks/decks'
end

get '/deck/:id/cards' do
  erb :cards
end

get '/'
