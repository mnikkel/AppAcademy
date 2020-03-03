def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(sentence, &prc)
  words = sentence.split(' ')
  changed = []
  words.each { |word| changed << prc.call(word) }
  changed.join(' ')
end

def greater_proc_value(num, prc1, prc2)
  p1 = prc1.call(num)
  p2 = prc2.call(num)
  p1 > p2 ? p1 : p2
end

def and_selector(arr, prc1, prc2)
  and_arr = []
  arr.each { |e| and_arr << e if prc1.call(e) && prc2.call(e) }
  and_arr
end

def alternating_mapper(arr, prc1, prc2)
  alt = []
  arr.each_index do |i|
    alt << if i.even?
             prc1.call(arr[i])
           else
             prc2.call(arr[i])
           end
  end
  alt
end
