class Board
  attr_accessor :board

  def initialize
    @board = (1..9).to_a
  end

  def show_board
    puts <<-board

      #{@board[0]} | #{@board[1]} | #{@board[2]}
      ---------
      #{@board[3]} | #{@board[4]} | #{@board[5]}
      ---------
      #{@board[6]} | #{@board[7]} | #{@board[8]} 

    board
  end

  def reset
    @board = []
    9.times{ @board << ' ' }
  end
end