class Board
  attr_accessor :board, :turn

  WINS = [[[0,0], [0,1], [0,2]], 
            [[1,0], [1,1], [1,2]], 
            [[2,0], [2,1], [2,2]],
            [[0,0], [1,0], [2,0]], 
            [[0,1], [1,1], [2,1]], 
            [[0,2], [1,2], [2,2]],
            [[0,0], [1,1], [2,2]], 
            [[0,2], [1,1], [2,0]]]

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @turn = 0
  end

  def show_board
    puts <<-board

      #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}
      ---------
      #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}
      ---------
      #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} 

    board
  end

  def win?
    WINS.each do |win|
      values = []
      win.each do |position|
        values << board[position.first][position.last]
      end
      if values.uniq.size == 1
        return true
      end
    end
    false
  end

  def get_free_spaces
    spaces = []
    board.each_with_index do |rows, row_index|
      rows.each_index do |index|
        if board[row_index][index] != 'X' &&  board[row_index][index] != 'O'
          spaces << [row_index, index]
        end
      end
    end
    spaces
  end

  def free_space?
    !get_free_spaces.empty? ? true : false
  end

  def find_position(position)
    coords = []
    board.each_with_index do |rows, row_index|
      rows.each_index do |index|
        if board[row_index][index] == position
          coords << row_index << index
        end
      end
    end
    coords
  end

  def position_free?(position)
    true if get_free_spaces.include?(find_position(position))
  end

  def take_position(position, marker)
    if position_free?(position)
      coords = find_position(position)
      @board[coords.first][coords.last] = marker
      @turn += 1
    else
      @turn += 0
      puts 'Invalid position. Please try again'
    end 
  end

end