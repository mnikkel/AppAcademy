class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each { |row| puts row.join(' ') }
  end

  def initialize(n)
    @grid = []
    n.times { @grid << Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.reduce(0) { |ships, row| ships + row.count(:S) }
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'you sunk my battleship!'
      return true
    end

    self[pos] = :X
    false
  end

  def place_random_ships
    count = @size / 4
    n = @grid.length - 1
    while count > 0
      pos = [rand(n), rand(n)]
      if self[pos] != :S
        self[pos] = :S
        count -= 1
      end
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map { |ele| ele == :S ? :N : ele }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
