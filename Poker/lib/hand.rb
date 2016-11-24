require_relative 'card'
require_relative 'deck'

class Hand
  # return the game point
  attr_accessor :hand

  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw_card }
  end

  def check_pair
    hash = Hash.new { |h, k| h[k] = 0}
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.any? { |key, val| val == 2}
  end

  def three_of_kind
    hash = Hash.new { |h, k| h[k] = 0}
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.any? { |key, val| val == 3}
  end

  def four_of_kind
    hash = Hash.new { |h, k| h[k] = 0}
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.any? { |key, val| val == 4}
  end


  def check_two_pair
    hash = Hash.new { |h, k| h[k] = 0}
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.count { |key, val| val == 2} == 2
  end

  def full_house
    hash = Hash.new { |h, k| h[k] = 0}
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.count == 2 && hash.any? {|key, val| val == 3}
  end

  def flush
    hash = Hash.new { |h, k| h[k] = 0}
    @hand.each do |card|
      hash[card.suit] += 1
    end
    hash.count == 1
  end

  def straight
    ordered_vals = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    arr = []
    @hand.each do |card|
      arr << card.value
    end
    (0..9).each do |start_pos|
      new_check = ordered_vals[start_pos..(start_pos + 4)]
      if new_check.all? { |el| arr.include?(el) }
        return true
      end
    end
    false
  end

  def straigh_flush
    straight && flush
  end

  def royal_flush
    royal = @hand.all? { |card| ["10", "J", "Q", "K", "A"].include?(card.value)}
    straigh_flush && royal
  end

  def return_points
    return 0 if royal_flush
    return 1 if straigh_flush
    return 2 if four_of_kind
    return 3 if full_house
    return 4 if flush
    return 5 if straight
    return 6 if three_of_kind
    return 7 if check_two_pair
    return 8 if check_pair
    9
  end

end
