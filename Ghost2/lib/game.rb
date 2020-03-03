require_relative 'player'
require 'byebug'
require 'set'

class Game
  def initialize(players)
    @players = players
    @dictionary = Set.new
    File.readlines('../dictionary.txt').each { |word| @dictionary.add(word.chomp) }
    @fragment = ''
    @current_player = @players[0]
    @losses = Hash.new(0)
  end

  def run
#    play_round until @losses.any? { |p, l| l > 4 }
     while @players.length > 1
       play_round
       losers = []
       @losses.each { |p, l| losers << p if l > 4 }
       losers.each { |loser| @players.delete(loser) }
     end
     puts 'The winner is ' + @players[0].name
  end

  def play_round
    valid_move = take_turn(@current_player)
    unless valid_move
      @losses[@current_player] += 1
      @fragment = ''
    end
    puts @current_player.name + "'s current record: " + record(@current_player)
    puts '----------------'
    puts 'Current fragment: ' + @fragment
    next_player!
    @current_player = @players[0]
  end

  def record(player)
    l = @losses[player]
    'GHOST'[0...l]
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def take_turn(player)
    guess = player.guess
    if valid_play?(guess)
      @fragment += guess
      return true
    end

    player.alert_invalid_guess
    false
  end

  def valid_play?(string)
    return false unless ('a'..'z').include?(string)

    pattern = /^#{@fragment + string}.+/
    match = @dictionary.any? { |word| pattern.match(word) }

    return true if @fragment.length < 3 && match

    return true if match && !@dictionary.include?(@fragment + string)

    false
  end
end

if __FILE__ == $PROGRAM_NAME
  a = Player.new('mark')
  b = Player.new('james')
  c = Player.new('sally')
  g = Game.new([a, b, c])
  g.run
end
