class Computer
  attr_reader :marker, :name, :board, :opponent_marker
  
  def initialize(marker, board)
    @marker = marker
    @name = 'computer'
    @board = board
  end

  def opponent_marker
    if @marker == 'x'
      @opponent_marker = 'o'
    elsif @marker == 'o'
      @opponent_marker = 'x'
    end
  end

  def move
    return take_center? if take_center?

    return take_corner if take_corner?

    binding.pry
    return play_corner if play_corner_if_empty?

    if play_side? == true
      return play_side
    end 
  end

  def take_center?
    center = [1,1]
    if @board.get_free_spaces.include?(center)
      @position = @board.board[center.first][center.last]
      @board.take_position(@position, marker)
      puts "#{self.name} plays position #{@position}"
      return true
    # else
    #   false
    end
    false
  end

  def take_corner?  
    corners = {
      [0,0] => [2,2],
      [0,2] => [2,0],
      [2,0] => [0,2],
      [2,2] => [0,0]
    }

    corners.each do |corner, opposite_corner|
      if @board.board[corner.first][corner.last] == opponent_marker && @board.board[opposite_corner.first][opposite_corner.last] != marker
        return true
      end
    end
    false
  end

  def take_corner
    if @board.board.first.first == opponent_marker #&& @board.board.last.last != marker
      @position = @board.board.last.last
      @board.take_position(@position, marker)
    elsif @board.board.first.last == opponent_marker #&& @board.board.last.first != marker
      @position = @board.board.last.first
      @board.take_position(@position, marker)
    elsif @board.board.last.first == opponent_marker #&& @board.board.first.last != marker
      @position = @board.board.first.last
      @board.take_position(@position, marker)
    elsif @board.board.last.last == opponent_marker #&& @board.board.first.first != marker
      @position = @board.board.first.first
      @board.take_position(@position, marker)
    else
      return false
    end
    puts "#{self.name} plays position #{@position}"
    true
  end

  def play_corner_if_empty?
    corners = [[0,0], [0,2], [2,0], [2,2]]
    corners.each do |corner|
      if @board.board[corner.first][corner.last] != 'x' || @board.board[corner.first][corner.last] != 'o'
        return true
      end
    end
    false
  end

  def play_corner
    corners = [[0,0], [0,2], [2,0], [2,2]]
    corners.each do |corner|
      if @board.board[corner.first][corner.last] != 'x' && @board.board[corner.first][corner.last] != 'o'
        @position = @board.board[corner.first][corner.last]
        @board.take_position(@position, marker)
        puts "#{self.name} plays position #{@position}"
        return true
      end
    end
    false
  end

  def play_side?
    sides = [[0,1], [1,0], [1,2], [2,1]]
    sides.each do |side|
      if @board.board[side.first][side.last] != 'x' || @board.board[side.first][side.last] != 'o'
        true
      end
    end
    false
  end

  def play_side
    sides = [[0,1], [1,0], [1,2], [2,1]]
    sides.each do |side|
      if @board.board[side.first][side.last] != 'x' || @board.board[side.first][side.last] != 'o'
        @position = @board.board[side.first][side.last]
        @board.take_position(@position, marker)
        true
      end
    end
    false
  end

  # def block?
  #   @board.
  # end
end