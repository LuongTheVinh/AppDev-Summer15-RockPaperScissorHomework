class GameController < ApplicationController

  RPS_MOVES = ['rock', 'paper', 'scissors']
  RPS_RESULTS = {
      ['rock', 'rock'] => 'tied',
      ['rock', 'paper'] => 'lost',
      ['rock', 'scissors'] => 'won',
      ['paper', 'rock'] => 'won',
      ['paper', 'paper'] => 'tied',
      ['paper', 'scissors'] => 'lost',
      ['scissors', 'rock'] => 'lost',
      ['scissors', 'paper'] => 'won',
      ['scissors', 'scissors'] => 'tied'}

  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  # Your code goes below.
  def play
    @user_move = params['the_move']
    @computer_move = RPS_MOVES.sample
    @result = RPS_RESULTS[[@user_move, @computer_move]]

    move = Move.new
    move.user_move = @user_move
    move.computer_move = @computer_move
    move.user_wins = @result == 'won'
    move.computer_wins = @result == 'lost'
    move.tie = @result == 'tied'
    move.save

    render('view.html.erb')
  end

end
