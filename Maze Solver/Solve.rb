require_relative './Maze.rb'

class Solve
  attr_reader :maze, :solution
  def initialize
    puts "Enter a maze file."
    file = gets.chomp
    @maze = Maze.new(file)
    @solution = @maze.dup
    @current = @maze.start
  end

  def make_move
    xc = @current[0]
    yc = @current[1]
    xe = @maze.end[0]
    ye = @maze.end[1]
    if xc < xe && @maze.coords(xc + 1, yc) == " "
      @current = [xc + 1, yc]
      @solution.set_point(xc+1, yc, "X")
    elsif yc < ye && @maze.coords(yc+1, ye) == " "
      @current = [xc, yc+1]
      @solution.set_point(xc, yc+1, "X")
    elsif yc > ye && @maze.coords(yc-1, ye) == " "
      @current = [xc, yc-1]
      @solution.set_point(xc, yc-1, "X")
    end
  end
end
