class Human
  attr_reader :marker, :name

  def initialize(marker)
    @marker = marker
    @name = 'human'
  end

  def move
    print "#{self.name}-#{self.marker} enter your position: "
    @position = gets.chomp.to_i

    if valid_position?(@position)
      puts "#{self.name}-#{self.marker} puts it on #{@position}"
    else
      puts 'Invalid position. Please try again.'
    end
  end

  def valid_position?(position)
    true if position >= 1 && position <= 9
  end

end