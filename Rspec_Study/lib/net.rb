def hello_world
  "hello world!"
end

def my_uniq(array)
  array.uniq
end

def two_sum(array)
  result = []
  # p array.length
  (0...(array.length - 1)).each do |i|
    ((i + 1)...array.length).each do |j|
      # p "i: #{i}"
      # p "j: #{j}"
      result << [i, j] if array[i] + array[j] == 0
    end
  end
  # p result
  result
end

def my_transpose(array)
  result = Array.new(array[0].length) { Array.new(array.length) }
  array.each_with_index do |row, i|
    row.each_with_index do |col, j|
      result[j][i] = array[i][j]
    end
  end
  result
end

def stock_picker(array)
  greatest_profit = nil
  greatest_pair = []
  (0...array.length-1).each do |i|
    (i+1...array.length).each do |j|
      # p "i: #{i}"
      # p "j: #{j}"
      if array[j] > array[i]
        profit = array[j] - array[i]
        if greatest_profit.nil? || profit > greatest_profit
          greatest_profit = profit
          greatest_pair = [i, j]
        end
      end
    end
  end
  # p greatest_profit
  greatest_pair
end

class Game
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [], []]
  end

  def move(a, b)
    if !@board[b].empty?
      if @board[b].first < @board[a].first
        return
      end
    end
    @board[b].unshift(@board[a].shift)
  end

  def won?
    @board == [[], [], [1, 2, 3]]
  end




end
# stock_picker([40, 30, 35, 40, 60, 55, 80, 70, 75])
