require 'card'
require 'rspec'


describe 'Card' do
  subject(:card) { Card.new("A", "D") }
  it 'returns the value' do
    expect(card.value).to eq("A")
  end

  it 'returns the suit' do
    expect(card.suit).to eq("D")
  end

end
