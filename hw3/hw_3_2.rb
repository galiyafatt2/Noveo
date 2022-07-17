def ranks(mas)
  rank = []
  mas1 = mas.sort.reverse
  (mas.size).times do |i|
    rank << mas1.index(mas[i])+1
  end
  rank
end
p ranks([3,3,3,3,3,5,1])
