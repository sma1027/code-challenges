class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def select_position
    print "Player #{self.marker}, please enter a number where you want to place your marker: "
    @position = gets.chomp.to_i
    
    if position_valid?(@position)
      @board[@position - 1] = "#{@marker}" 
      print "Player #{self.marker} puts it on #{@position}"
      @turn += 1
    else
      puts 'Invalid position. Please try again.'
      @turn += 0
    end
  end

  def position_valid?(position)
    binding.pry
    true if position >= 1 && position <= 9 && @board[position-1] == " "
  end
end