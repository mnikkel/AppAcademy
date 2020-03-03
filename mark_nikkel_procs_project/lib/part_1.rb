def my_map(arr, &prc)
  map = []
  arr.each { |e| map << prc.call(e) }
  map
end

def my_select(arr, &prc)
  select = []
  arr.each { |e| select << e if prc.call(e) }
  select
end

def my_count(arr, &prc)
  count = 0
  arr.each { |e| count += 1 if prc.call(e) }
  count
end

def my_any?(arr, &prc)
  any = false
  arr.each { |e| any = true if prc.call(e) }
  any
end

def my_all?(arr, &prc)
  all = true
  arr.each { |e| all = false unless prc.call(e) }
  all
end

def my_none?(arr, &prc)
  none = true
  arr.each { |e| none = false if prc.call(e) }
  none
end
