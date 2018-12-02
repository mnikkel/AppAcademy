require_relative './Maze.rb'

class Solve
  def initialize
    puts "Enter a maze file."
    file = gets.chomp
    @maze = Maze.new(file)
  end
end
