require 'deck'
require 'player'

class Game
  attr_accessor :deck
  def initialize(player_a = Player.new("Alice", 1000, deck = Deck.new ), player_b = Player.new("Bod", 800, deck = Deck.new))
    @deck = Deck.new
    @player_a = player_a
    @player_b = player_b
    @current_player = @player_a
    @last_player = nil
    @game_pot = @current_player.game_pot

  end

  def turn
    if @current_player == @player_a
      puts "Player A Turn!"
    else
      puts "Player B Turn!"
    end
  end


  def switch_player
    # output the object of which player
    in_turn = @last_player
    @last_player = @current_player
    in_turn
  end


  def get_pot_amount
    @game_pot
  end


end
