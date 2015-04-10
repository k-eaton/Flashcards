get '/' do
  erb :index
end

get '/decks/:id/cards' do
  @individual_deck = Deck.find(params[:id])
  @all_cards_in_deck = Card.where(deck_id: @individual_deck.id)
  erb :cards
end

get '/decks/:deck_id/cards/new' do
  @deck_id = params[:deck_id]

end

get '/decks/:deck_id/cards/:card_id' do
  @individual_card = Card.find(params[:card_id])
  erb :card
end

post '/decks/:id/cards/' do
  @new_card = Card.new(card: params[:card])
    if @card.save
      redirect '/decks/:id/cards'
    else
      'Invalid'
      erb :new
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

get '/play/decks/show' do
  @all_decks = Deck.all

erb :"decks/play_show_decks"
end

get '/play/decks/:id' do
  @message = "Welcome! Pick the right answer"
  @all_cards = Deck.find(params[:id]).cards.all
  @this_card = 0
  if true
    if true # == @this_card.correct_answer
      @message = "Correct! How about this one?"
      @this_card += 1
    else
      @message = "WRONG! Maybe you'll have better luck with this one:"
      @this_card += 1
    end
  end

  erb :"decks/play_card"
end

