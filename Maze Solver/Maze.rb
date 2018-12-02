class Maze
  attr_reader :maze, :start, :end

  def initialize(file)
    @maze = load_maze(file)
    @start = find_point("S")
    @end = find_point("E")
  end

  def load_maze(file)
    f = File.open(file)
    maze_array = []
    f.each { |line| maze_array << line.chomp.split("") }
    maze_array
  end

  def find_point(point)
    @maze.each_with_index do |line, i|
      found = line.index(point)
      return [i, found] if found
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  m = Maze.new('./maze1.txt')
  p m.start
  p m.end
end
