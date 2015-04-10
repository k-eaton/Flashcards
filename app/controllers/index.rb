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
  session[:score] = 0

  erb :"decks/play_show_decks"
end

get '/play/decks/:deck_id/cards/:card_id/:que' do
  @deck = Deck.find(params[:deck_id])
  @all_cards = @deck.cards.all
  @card_iterator = params[:card_id].to_i
  if params[:card_id].to_i < (@all_cards.length - 1)
    if params[:que] == "first"
      @message = "Welcome! Pick the right answer"
    elsif params[:que] == "correct" #@this_card.correct_answer
      @message = "Correct! How about this one?"
      @card_iterator += 1
    elsif params[:que] == "incorrect"
      @message = "WRONG! Maybe you'll have better luck with this one:"
      @card_iterator += 1
    else
      @message = "Error. Don't ya hate that? Start over again."
    end
  erb :"decks/play_card"
  else
    @message = "Nice job!"
    @completed_message = "You got #{session[:score]} out of #{@all_cards.length}"
  erb :"decks/completed"
  end
end

post '/play/decks/:deck_id/cards/:card_id' do
    if params[:selected] == "correct_answer"
      session[:score] += 1
      p "&"*80
      p session[:score]
      redirect "/play/decks/#{params[:deck_id]}/cards/#{params[:card_id]}/correct"
    elsif
      params[:selected] != "correct_answer"
      p session[:score]
      redirect "/play/decks/#{params[:deck_id]}/cards/#{params[:card_id]}/incorrect"
    end
end

