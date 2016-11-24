require 'rspec'
require 'hand'
require 'deck'

describe 'Hand' do
  deck = Deck.new.dup
  subject(:hand) { Hand.new(deck) }

  describe '#check_pair' do
    it 'returns true if there is a pair' do
      hand.hand = [Card.new("A", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"),Card.new("5", "S")]
      expect(hand.check_pair).to eq(true)
    end

    it 'returns false if there is not a pair' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.check_pair).to eq(false)
    end
  end

  describe '#three_of_kind' do
    it 'returns true if there is a three of a kind' do
      hand.hand = [Card.new("A", "S"), Card.new("A", "C"), Card.new("A", "H"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.three_of_kind).to eq(true)
    end

    it 'returns false if there is not a three of a kind' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.three_of_kind).to eq(false)
    end
  end

  describe '#four_of_kind' do
    it 'returns true if there is a four of a kind' do
      hand.hand = [Card.new("A", "S"), Card.new("A", "C"), Card.new("A", "H"), Card.new("A", "D"), Card.new("5", "S")]
      expect(hand.four_of_kind).to eq(true)
    end

    it 'returns false if there is not a four of a kind' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.four_of_kind).to eq(false)
    end
  end

  describe '#check_two_pair' do
    it 'returns true if there is a two pairs' do
      hand.hand = [Card.new("A", "S"), Card.new("A", "C"), Card.new("6", "H"), Card.new("6", "D"), Card.new("5", "S")]
      expect(hand.check_two_pair).to eq(true)
    end

    it 'returns false if there is not a two pairs' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.check_two_pair).to eq(false)
    end
  end

  describe '#full_house' do
    it 'returns true if there is a full house' do
      hand.hand = [Card.new("A", "S"), Card.new("A", "C"), Card.new("A", "H"), Card.new("6", "D"), Card.new("6", "S")]
      expect(hand.full_house).to eq(true)
    end

    it 'returns false if there is not a full house' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.full_house).to eq(false)
    end
  end

  describe '#flush' do
    it 'returns true if there is a flush' do
      hand.hand = [Card.new("A", "S"), Card.new("K", "S"), Card.new("J", "S"), Card.new("9", "S"), Card.new("6", "S")]
      expect(hand.flush).to eq(true)
    end

    it 'returns false if there is not a flush' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.flush).to eq(false)
    end
  end

  describe '#straight' do
    it 'returns true if there is a straight' do
      hand.hand = [Card.new("A", "S"), Card.new("4", "D"), Card.new("2", "C"), Card.new("5", "S"), Card.new("3", "C")]
      expect(hand.straight).to eq(true)
    end

    it 'returns false if there is not a straight' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.straight).to eq(false)
    end
  end

  describe '#straigh_flush' do
    it 'returns true if there is a straigh flush' do
      hand.hand = [Card.new("3", "S"), Card.new("4", "S"), Card.new("2", "S"), Card.new("5", "S"), Card.new("6", "S")]
      expect(hand.straigh_flush).to eq(true)
    end

    it 'returns false if there is not a straigh flush' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.straigh_flush).to eq(false)
    end
  end

  describe '#royal_flush' do
    it 'returns true if there is a royal flush' do
      hand.hand = [Card.new("J", "S"), Card.new("A", "S"), Card.new("Q", "S"), Card.new("10", "S"), Card.new("K", "S")]
      expect(hand.royal_flush).to eq(true)
    end

    it 'returns false if there is not a royal flush' do
      hand.hand = [Card.new("7", "S"), Card.new("A", "H"), Card.new("3", "S"), Card.new("4", "D"), Card.new("5", "S")]
      expect(hand.royal_flush).to eq(false)
    end
  end

  describe '#return_points' do
    it 'make sure straigh_flush wont be messed up by flush of straigh' do
      hand.hand = [Card.new("3", "S"), Card.new("4", "S"), Card.new("2", "S"), Card.new("5", "S"), Card.new("6", "S")]
      expect(hand.return_points).to eq(1)
    end
  end

  describe '#return_points' do
    it 'returns high card point if didnt pass any tests' do
      hand.hand = [Card.new("9", "S"), Card.new("7", "D"), Card.new("2", "C"), Card.new("5", "S"), Card.new("6", "S")]
      expect(hand.return_points).to eq(9)
    end
  end
end
