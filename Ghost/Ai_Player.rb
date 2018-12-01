class Ai_Player
  attr_reader :name
  def initialize
    @name = "AI"
  end

  def guess
    puts "#{self.name} -- Enter a letter:"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid guess"
  end
end
