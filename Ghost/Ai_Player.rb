class Ai_Player
  attr_reader :name
  def initialize
    @name = "AI"
  end

  def guess(fragment, dictionary)
    if fragment.length == 0
      return dictionary.keys.sample[0]
    end
    all_words = find_all_words(fragment, dictionary)
    longest = all_words.sort_by { |word| word.length }.last
    turn = longest[fragment.length]
    puts "AI chose: #{turn}"
    turn
  end

  def find_all_words(fragment, dictionary)
    dictionary.keys.select { |word| word.start_with?(fragment) }
  end

  def alert_invalid_guess
    puts "Invalid guess"
  end
end
