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

get '/play/decks/show' do
  @all_decks = Deck.all

  erb :"decks/play_show_decks"
end

get '/play/decks/:deck_id/cards/:card_id' do
  @message = "Welcome! Pick the right answer"
  @deck = Deck.find(params[:deck_id])
  @all_cards = @deck.cards.all
  @card_iterator = params[:card_id].to_i
  if true
    if true # == @this_card.correct_answer
      @message = "Correct! How about this one?"
      @card_iterator += 1
    else
      @message = "WRONG! Maybe you'll have better luck with this one:"
      @card_iterator += 1
    end
  end

  erb :"decks/play_card"
end

post '/play/decks/:deck_id/cards/:card_id' do
  p "&"*80
  p params
  redirect "/play/decks/#{params[:deck_id]}/cards/#{params[:card_id]}"
end

