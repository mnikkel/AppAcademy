class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |c, i| indices << i if c == char }
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end

    @attempted_chars << char
    indices = get_matching_indices(char)
    @remaining_incorrect_guesses -= 1 if indices.empty?
    fill_indices(char, indices)
    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    return false unless @guess_word.join == @secret_word

    puts 'WIN'
    true
  end

  def lose?
    return false unless @remaining_incorrect_guesses.zero?

    puts 'LOSE'
    true
  end

  def game_over?
    return false unless win? || lose?

    puts 'The secret word was: ' + @secret_word
    true
  end
end
