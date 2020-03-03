class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    print @name + ', enter your guess: '
    g = gets.chomp
    puts '----------------'
    g
  end

  def alert_invalid_guess
    puts 'Wrong! You get a letter.'
  end
end
