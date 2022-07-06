def sum(arr)
  s = 0
  s += arr.shift + sum(arr) if arr != []
  s
end

puts sum([1, 2, 3, 4])
