get '/' do
  erb :index
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

get '/decks/:id/cards/:id' do
  @individual_card = Card.where(id: params[:id]).first
  erb :card
end


post '/decks/:id/cards' do
end

put '/decks/:id/cards/:id' do #This could possibly be changed to the display deck page rather than requiring a specific card id.
  #This route allows you to update cards.
end

delete '/decks/:id/cards/:card_id' do
  @to_be_deleted = Card.where(id: params[:card_id]).first
  @forward = @to_be_deleted.deck_id.to_s
  @to_be_deleted.delete
  redirect '/decks/'+@forward+'/edit'
end

