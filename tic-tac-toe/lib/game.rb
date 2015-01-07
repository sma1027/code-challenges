class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @turn = 0
    print_instructions
  end

  def print_instructions
    puts <<-INSTRUCTIONS.gsub(/^\s{6}/,"") 
      TIC-TAC-TOE
      Let's play tic-tac-toe!!
      
      Shown below is the tic-tac-toe board. The 1st player's marker is X and 2nd player's marker is O. To play, enter the position you want to place your marker as indicated by the numbers.
    INSTRUCTIONS

    @board.show_board
    @board.reset

    puts <<-game_type.gsub(/^\s{6}/,"")  
      To begin, please select which game you want to play
      1 - human vs human
      2 - human vs computer
      3 - computer vs human

    game_type

    get_selection
    play(@player1, @player2)
  end

  def get_selection
    print "Enter your selection: "
    @selection = gets.chomp.to_i

    if selection_valid?(@selection)
      case @selection
      when 1
        @player1 = Human.new('X')
        @player2 = Human.new('O')
      when 2
        @player1 = Human.new('X')
        @player2 = Computer.new('O')
      when 3
        @player1 = Computer.new('X')
        @player2 = Human.new('O')
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
    true if selection == 1 || selection == 2 || selection == 3
  end

  def play(player1, player2)
    
  end
end