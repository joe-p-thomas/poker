require 'set'
require_relative 'card'
class Deck
  attr_accessor :deck

  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  SUITS = ["D", "C", "H", "S"]


  def initialize
    @deck = []
    populate
  end

  def populate
    VALUES.each do |value|
      SUITS.each do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end

  def number_count
    set = Set.new
    @deck.each do |card|
      set.add(card.value)
    end
    set.count
  end

  def suit_count
    set = Set.new
    @deck.each do |card|
      set.add(card.suit)
    end
    set.count
  end

  def total_count
    @deck.count
  end

  def shuffle_deck
    @deck.shuffle
  end


  def draw_card
    given = @deck[rand(@deck.length)]
    @deck.delete(given)
    given
  end
end
