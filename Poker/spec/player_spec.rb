require 'rspec'
require 'player'
require 'deck'

describe 'Player' do
  deck = Deck.new
  subject(:player) { Player.new("Bod", 1000, deck) }
  describe '#has_hand?' do
    it 'returns true if it has a hand' do
      expect(player.has_hand?).to eq(true)
    end
  end

  describe '#pot_amount' do
    it 'returns the pot amount' do
      expect(player.pot_amount).to eq(1000)
    end
  end

  # describe '#receive_cards' do
  #   it 'receices cards to hand' do
  #     player.hand.hand = player.hand.hand.take(3)
  #     player.receive_cards(2)
  #     expect(player.hand.hand.count).to eq(5)
  #   end
  # end


end
