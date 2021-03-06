class Maze
  attr_reader :maze, :start, :end

  def initialize(file)
    @maze = load_maze(file)
    @start = find_point("S")
    @end = find_point("E")
  end

  def coords(x, y)
    @maze[y][x]
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
      return [found, i] if found
    end
  end

  def set_point(x, y, p)
    @maze[y][x] = p
  end

  def print
    pretty = ""
    @maze.each do |line|
      pretty += line.join + "\n"
    end
    pretty
  end
end

if __FILE__ == $PROGRAM_NAME
  m = Maze.new('./maze1.txt')
  p m.start
  p m.end
end
