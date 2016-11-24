require 'net'
require 'rspec'

describe 'method name' do
  it 'when valid' do
    expect(hello_world).to eq("hello world!")
  end
end

describe '#my_uniq' do
  it 'returns uniq members array' do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end
end

describe '#two_sum' do
  it "returns index pair of sum that equals 0" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end
end

describe '#my_transpose' do
  it 'returns the transpose of the original matrix' do
    expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
end

describe '#stock_picker' do
  it 'returns index pair that gains maximum profit' do
    expect(stock_picker([40, 30, 35, 40, 60, 55, 80, 70, 75])).to eq([1, 6])
  end

  it 'returns empty array if in bear market' do
    expect(stock_picker([100,90,30,0])).to eq([])
  end
end


describe 'Towers of Hanoi' do
  subject(:game) { Game.new }
  # already initialize a board here
  describe '#move' do
    context 'when valid move' do
      it 'alters the board' do
        game.board = [[1, 2, 3], [], []]
        # change the board
        game.move(0, 1)
        expect(game.board).to_not eq([[1, 2, 3], [], []])
      end
    end

    context 'when invalid move' do
      it 'does not alter the board' do
        game.board = [[2, 3], [], [1]]
        expect(game.move(0, 2)).to_not eq([[3], [], [2, 1]])
      end
    end

  end

  describe '#won?' do
    it 'returns true for winning board' do
      game.board = [[], [], [1, 2, 3]]
      expect(game.won?).to eq(true)
    end

    it 'returns false for non-winning board' do
      expect(game.won?).to eq(false)
    end
  end
end
