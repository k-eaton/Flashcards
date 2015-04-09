get '/' do
  erb :index
end

get '/deck' do
  erb :deck
end

get '/deck/:id/cards' do
  erb :cards
end
