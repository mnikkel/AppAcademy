require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "Number of ships: #{@board.num_ships}"
    @board.print
  end

  def lose?
    return false if @remaining_misses > 0

    puts 'you lose'
    true
  end

  def win?
    return false if @board.num_ships > 0

    puts 'you win'
    true
  end

  def game_over?
    lose? || win?
  end

  def turn
    pos = @player.get_move
    hit = @board.attack(pos)
    @board.print
    @remaining_misses -= 1 unless hit
    puts "Remaining misses: #{@remaining_misses}"
  end
end
