# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def prime?(num)
  (2...num).each { |i| return false if num % i == 0 }
  true
end

def largest_prime_factor(num)
  num.downto(2) { |i| return i if (num % i).zero? && prime?(i) }
end

def unique_chars?(str)
  count = Hash.new(0)
  str.each_char { |c| count[c] += 1 }
  count.values.none? { |v| v > 1 }
end

def dupe_indices(arr)
  indices = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index { |e, i| indices[e] << i }
  indices.select { |k, v| v.length > 1 }
end

def ana_array(arr1, arr2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  arr1.each { |e| hash1[e] += 1 }
  arr2.each { |e| hash2[e] += 1 }
  hash1 == hash2
end
