require_relative './Player.rb'
require_relative './Ai_Player.rb'

class Game
  attr_reader :fragment

  def initialize(*players)
    @players = players
    @fragment = ""
    @dictionary = {}
    File.readlines("dictionary.txt").each do |word|
      @dictionary[word.chomp] = true
    end
    @current_player = @players[0]
    @previous_player = @players[-1]
    @losses = Hash.new(0)
    @players.each { |p| @losses[p] = 0 }
  end

  def play_round
    turn = take_turn(@current_player)
    if valid_play?(turn)
      @fragment += turn
    else
      @current_player.alert_invalid_guess
      @losses[@current_player] += 1
      record(@current_player)
      @fragment = ""
    end
  end

  def next_player!
    @players.rotate!
    @current_player = @players[0]
    previous_player = @players[-1]
  end

  def take_turn(player)
    player.guess(@fragment, @dictionary)
  end

  def valid_play?(*char)
    return false if char.length > 1
    char = char[0]
    return false if !("a".."z").include?(char.downcase)
    length = @fragment.length + 1
    @dictionary.each do |word, v|
      if word[0...length] == @fragment + char && word.length > length
        return true
      end
    end
    false
  end

  def losses
    losses.values
  end

  def record(player)
    puts "#{player.name}'s record:"
    puts "GHOST"[0...@losses[@current_player]]
  end

  def run
    while @players.length > 1
      play_round
      if @losses[@current_player] == 5
        puts "#{@current_player.name} loses."
        next_player!
        @players = @players[0...-1]
        next
      end
      next_player!
    end
    puts "#{@players[0].name} is the winner"
  end
end

if __FILE__ == $PROGRAM_NAME
  p1 = Player.new("Mark")
  p2 = Ai_Player.new
  g = Game.new(p1, p2)
  g.run
end
