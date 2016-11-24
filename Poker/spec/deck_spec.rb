require 'rspec'
require 'deck'

describe 'Deck' do
  subject(:cards) { Deck.new }
  it 'checks we have 13 numbers' do
    expect(cards.number_count).to eq(13)
  end

  it 'checks we have 4 suits' do
    expect(cards.suit_count).to eq(4)
  end

  it 'checks we have 52 cards totally' do
    expect(cards.total_count).to eq(52)
  end

end

describe '#shuffle_deck' do
  subject(:deck) { Deck.new }

  it 'checks the deck if it is unshuffled' do
      original_deck = deck.deck.dup
      # deck.deck => the first deck means the object call
      # the second pass the deck method from the Deck class
      expect(deck.deck).to eq(original_deck)
  end
  it 'checks the deck if it is shuffled' do
      original_deck = Deck.new
      deck.shuffle_deck
      expect(deck.deck).to_not eq(original_deck.deck)
      # the first deck above is the object :deck we shuffled
  end
end

describe '#draw_card' do
  subject(:deck) { Deck.new }
  it 'returns the card given, type check' do
    expect(deck.draw_card).to be_a(Card)
    # Card is a object type
  end

  it 'removes the given card from deck' do
    deck.draw_card
    expect(deck.deck.length).to eq(51)
  end

end
