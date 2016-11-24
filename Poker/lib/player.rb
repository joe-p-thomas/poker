require_relative 'hand'
require_relative 'deck'

class Player
  attr_accessor :player_name, :money, :hand
  def initialize(player_name, money, deck, game_pot = 0, personal_pot = 0, last_pot = 0)
    @player_name = player_name
    @money = money
    @hand = Hand.new(deck)
    @deck = deck
    @game_pot = game_pot
    @personal_pot = personal_pot
    @last_pot = last_pot
  end

  def has_hand?
    return true if !@hand.nil?
    false
  end

  def pot_amount
    @money
  end

  def discard_choice
    puts "Cards want to discard?"
    choice_times = gets.chomp.to_i
    arr = []
    choice_times.times do |i|
      puts "Please select your #{i + 1} card from index 0..4"
      arr << @hand.hand[gets.chomp.to_i]
    end
    arr
    @hand.hand -= arr
    receive_cards(choice_times)
  end


  def receive_cards(choice_times)
    choice_times.times { |i| @hand.hand << @deck.draw_card }
    guess_option?
  end

  def guess_option?
    puts "Press 0 if you want to fold!"
    puts "Press 1 if you want to see!"
    puts "Press 2 if you want to raise!"
    request = gets.chomp.to_i
    return fold if request == 0
    return see if request == 1
    return raise_bet if request == 2
  end


  def fold
    @hand.hand = []
    @game_pot += @personal_pot
    p "You fold!"
  end

  def see
    p "Here is the game pot"
    @game_pot
    guess_option?
  end

  def raise_bet
    p "You have to put at least"
    @last_pot
  end
end

# deck = Deck.new
# hand = Hand.new(deck)
# player = Player.new("Bob", 1000, deck)
# player.discard_choice
