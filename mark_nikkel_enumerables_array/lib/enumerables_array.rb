class Array
  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    selected = []
    my_each { |ele| selected << ele if prc.call(ele) }
    selected
  end

  def my_reject(&prc)
    rejected = []
    my_each { |ele| rejected << ele unless prc.call(ele) }
    rejected
  end

  def my_any?(&prc)
    my_each { |ele| return true if prc.call(ele) }

    false
  end

  def my_all?(&prc)
    my_each { |ele| return false unless prc.call(ele) }

    true
  end

  def my_flatten
    return [self] unless is_a?(Array)

    flat = []
    my_each do |ele|
      if ele.is_a?(Array)
        flat += ele.my_flatten
      else
        flat << ele
      end
    end
    flat
  end

  def my_zip(*zip)
    zipped = Array.new(length) { Array.new }
    (0...length).each do |i|
      zipped[i] << self[i] || nil
      zip.my_each { |arr| zipped[i] << arr[i] || nil }
    end

    zipped
  end

  def my_rotate(count = 1)
    rotated = self[0..-1]
    if count.negative?
      count *= -1
      count.times { rotated.unshift(rotated.pop) }
    else
      count.times { rotated = rotated.drop(1).push(rotated.first) }
    end
    rotated
  end

  def my_join(sep = '')
    joined = ''
    my_each { |c| joined += c + sep }
    joined = joined[0...-1] unless sep == ''
    joined
  end

  def my_reverse
    reversed = []
    my_each { |ele| reversed.unshift(ele) }
    reversed
  end

  def bubble_sort!(&prc)
    sorted = false
    until sorted
      sorted = true
      (0...length - 1).each do |i|
        order = prc.call(self[i], self[i + 1])
        if order == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    copy = dup
    copy.bubble_sort!(&prc)
  end
end

def factors(num)
  fact = []
  (1..num).each { |n| fact << n if (num % n).zero? }
  fact
end

def substrings(string)
  sub = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      sub << string[i..j]
    end
  end
  sub.uniq
end

def subwords(string, dictionary)
  sub = substrings(string)
  sub.select { |item| dictionary.include?(item) }
end
