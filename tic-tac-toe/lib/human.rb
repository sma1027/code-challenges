class Human
  attr_reader :marker, :name

  def initialize(marker)
    @marker = marker
    @name = 'human'
  end

  def move
    print "#{self.name}-#{self.marker} enter your position: "
    @position = gets.chomp.to_i
  end

end