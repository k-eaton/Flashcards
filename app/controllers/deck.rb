get '/decks' do
  erb :'decks/decks'
end

get '/decks/:id' do
  erb :'decks/deck'
end

get '/decks/new' do
  erb :'decks/new'
end

post '/decks/new' do
  redirect '/decks'
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
