# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  group = []
  str.each_char do |c|
    if group.empty?
      group.push([c])
    elsif c == group.last[0]
      group.last.push(c)
    else
      group.push([c])
    end
  end
  compressed = ''
  group.each do |el|
    if el.length > 1
      compressed = compressed + el.length.to_s + el[0]
    else
      compressed += el[0]
    end
  end
  compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
