class Board
  attr_reader :board
  
  WINS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = (1..9).to_a
  end

  def show_board
    puts <<-board
    
    Tic-Tac-Toe Game
    
      #{@board[0]} | #{@board[1]} | #{@board[2]}
      ---------
      #{@board[3]} | #{@board[4]} | #{@board[5]}
      ---------
      #{@board[6]} | #{@board[7]} | #{@board[8]}
    
    board
  end

  def reset
    @board = []
    9.times{ @board << " " }
  end

  def win?
    WINS.each do |win|
      if @board[win[0]] != " " && @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]]
        puts "Game Over! #{@marker} wins"
        return true
      end
    end

    false
  end
end