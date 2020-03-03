def even?(num)
  (num % 2).zero?
end

def select_even_nums(num_array)
  num_array.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog| dog['age'] < 3 }
end

def count_positive_subarrays(darray)
  darray.count { |arr| arr.sum.positive? }
end

def aba_translate(word)
  aba = ''
  vowels = 'aeiou'
  word.each_char do |c|
    aba += if vowels.include?(c)
             c + 'b' + c
           else
             c
    end
  end
  aba
end

def aba_array(words)
  words.map { |word| aba_translate(word) }
end
