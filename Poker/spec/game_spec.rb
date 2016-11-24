require 'rspec'
require 'game'


describe 'Game' do
  subject(:game) { Game.new }
  it 'deck accessor check' do
    expect(game.deck).to_not eq(nil)
  end

  describe '#get_pot_amount' do
    it 'gets pot amount' do
      expect(game.get_pot_amount).to eq(0)
    end
  end
  
end
