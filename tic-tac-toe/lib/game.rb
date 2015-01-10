class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    print_instructions
  end

  def print_instructions
    puts <<-INSTRUCTIONS.gsub(/^\s{6}/,"") 
      TIC-TAC-TOE
      Let's play tic-tac-toe!!
      
      Shown below is the tic-tac-toe board. The 1st player's marker is X and 2nd player's marker is O. To play, enter the position you want to place your marker as indicated by the numbers.
    INSTRUCTIONS

    @board.show_board
    # @board.reset

    puts <<-game_type.gsub(/^\s{6}/,"")  
      To begin, please select which game you want to play
      1 - human vs human
      2 - human vs computer
      3 - computer vs human

    game_type

    get_selection
    play(@player1, @player2)
    @board.winner?(@player1, @player2)
  end

  def get_selection
    print "Enter your selection: "
    @selection = gets.chomp.to_s

    if selection_valid?(@selection)
      case @selection
      when '1'
        @player1 = Human.new('x')
        @player2 = Human.new('o')
      when '2'
        @player1 = Human.new('x')
        @player2 = Computer.new('o', @board)
      when '3'
        @player1 = Computer.new('x', @board)
        @player2 = Human.new('o')
      end
      
      puts "You selected choice #{@selection} - #{@player1.name} vs #{@player2.name}"

      puts "Let the game begin!!!"
      
      @board.show_board
    else
      puts "Invalid section. Please try again"
      get_selection
    end
  end

  def selection_valid?(selection)
    true if selection == '1' || selection == '2' || selection == '3'
  end

  def play(player1, player2)
    while !@board.win? && @board.free_space?
      if @board.turn % 2 == 0
        if @player1.instance_of? Human
          position = @player1.move
          @board.take_position(position, @player1.marker)
        else
          @player1.move
        end
      elsif @board.turn % 2 == 1
        if @player2.instance_of? Human
          position = @player2.move
          @board.take_position(position, @player2.marker)
        else
          @player2.move
        end
      end
      @board.show_board
    end
  end

end