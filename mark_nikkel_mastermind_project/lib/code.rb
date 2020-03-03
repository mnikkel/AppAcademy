class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.key?(peg.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(pegs_string)
    pegs = pegs_string.split('').map(&:upcase)
    Code.new(pegs)
  end

  def initialize(pegs)
    raise 'Invalid pegs' unless Code.valid_pegs?(pegs)

    @pegs = pegs.map(&:upcase)
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(instance)
    matches = 0
    length.times { |i| matches += 1 if self[i] == instance[i] }
    matches
  end

  def num_near_matches(instance)
    # Rspec allows pegs that are exact matches to also count as near
    # matches for other pegs. The commented out code is how mastermind
    # actually works.

    # all_matches = POSSIBLE_PEGS.keys.reduce(0) do |matches, peg|
    #   matches + [@pegs.count(peg), instance.pegs.count(peg)].min
    # end
    # all_matches - num_exact_matches(instance)

    near_matches = 0
    length.times do |i|
      near_matches += 1 if @pegs.include?(instance[i]) && @pegs[i] != instance[i]
    end
    near_matches
  end

  def ==(other)
    @pegs == other.pegs
  end
end
