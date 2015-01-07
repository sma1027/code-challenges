class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    instructions
  end

  def instructions
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
  end

  def get_selection
    print "Enter your selection: "
    @selection = gets.chomp.to_i

    if selection_valid?(@selection)
      case @selection
      when 1
        game_type = 'human vs human'
      when 2
        game_type = 'human vs computer'
      when 3
        game_type = 'computer vs human'
      end
      
      puts "You selected game type #{@selection} - #{game_type}."
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
end