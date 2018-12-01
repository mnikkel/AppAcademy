class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess(fragment, dictionary)
    puts "Current Fragment: #{fragment}"
    puts "#{self.name} -- Enter a letter:"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid guess"
  end
end
