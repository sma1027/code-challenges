require 'pry'

class Game
  attr_accessor :player1, :player2

  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = (1..9).to_a

    @player1 = 'Player1'
    @player2 = 'Player2'

    @turn = 1

    print_instructions

    self.play
  end

  def print_instructions
    puts <<-INSTRUCTIONS.gsub(/^\s{6}/,"") 
      Let's play tic-tac-toe!!
      
      Shown below is the tic-tac-toe board. Player 1 is X and Player 2 is O. To play, enter the position you want to place your marker as indicated by the numbers.
    INSTRUCTIONS

    show_board
    self.reset

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
      when 2
        @player2 = 'Computer'
      when 3
        @player1 = 'Computer'
      end
      
      puts "You chose game type #{@selection} - #{@player1} vs #{@player2}"
      puts "Let the game begin!!!"
      
      show_board
    else
      puts "Invalid section. Please try again"
      get_selection
    end
  end

  def selection_valid?(selection)
    true if selection == 1 || selection == 2 || selection == 3
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

  def play
    while !win?
      if @turn % 2 == 1
        @marker = 'X'
        if @player1 == 'Player1'
          human_play(@player1)
        else
          computer_play
        end
      else
        @marker = 'O'
        if @player2 == 'Player2'
          human_play(@player2)
        else
          computer_play
        end
      end

      show_board
      @turn += 1
    end
  end

  def human_play(player)
    print "#{player}, please enter a number where you want to place your marker: "
    @position = gets.chomp.to_i
    if position_valid?(@position)
      @board[@position - 1] = "#{@marker}" 
      print "#{player} puts it on #{@position}"
    else
      puts 'Invalid position. Please try again.'
    end 
  end

  def position_valid?(position)
    true if position >= 1 && position <= 9 && @board[position-1] == " "
  end
      
  # def human_vs_computer
  #   while !win?
  #     if @turn % 2 == 0
  #       if @turn == 0
  #         @position = rand(10)
  #       else
  #         computer_play
  #       end
  #       @board[@position] = 'X'
  #       print "#{@player2} puts it on #{@position+1}"
  #     else
  #       human_play
  #       if position_valid?(@position)
  #         @board[@position - 1] = 'O' 
  #         print "#{@player1} puts it on #{@position}"
  #       else
  #         puts 'Invalid position. Please try again.'
  #       end 
  #     end
  #     show_board
  #     @turn += 1
  #   end
  # end  

  def computer_play
    WINS.each do |win|
      if @board[win[0]] == @board[win[1]] && @board[win[2]] == " "
        @position = win[2]
      elsif @board[win[0]] == @board[win[2]] && @board[win[1]] == " "
        @position = win[1]
      elsif @board[win[1]] == @board[win[2]] && @board[win[0]] == " "
        @position = win[0]
      end
    end
    @board[@position] = "#{@marker}"
    print "Computer puts it on #{@position + 1}"
  end

  # def human_vs_human
  #   @player = @turn % 2 + 1

  #   while !win?
  #     print "Player #{@player}, please enter a number where you want to place your marker: "
  #     @marker = gets.chomp.to_i

  #     if marker_valid?(@marker)
  #       print "Player #{@player} placed your marker on position #{@marker}"
        
  #       if @turn % 2 == 0
  #         @board[@marker - 1] = 'X'
  #       elsif @turn % 2 == 1
  #         @board[@marker - 1] = 'O'
  #       end

  #       show_board
  #       @turn += 1
  #       @player = @turn % 2 + 1
  #     else
  #       puts 'Invalid position. Please try again.'
  #     end
  #   end
  # end

  def win?
    WINS.each do |win|
      if @board[win[0]] != " " && @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]]
        puts "Game Over!"
        return true
      end
    end

    false
  end
  
end

game = Game.new