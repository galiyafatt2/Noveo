[1, 2, 3, 4].select{|element| element%2==0}
[1,2,3,4].map{|element| element**2}
[1, 2, 3, 4].delete_if{|element| element%2!=0}
[1, 2, 3, 4].each_with_object(Hash.new(0)) do |element, hash|
  hash[element] += 1
end

(1..4).select{|element| element%2==0}
(1..4).map{|element| element**2}
(1..4).each_with_object([]) do |item, array|
  array << item ** 2
end

{a: 1, b: 2, c: 3}.select{|key, value| value == 3}
{a: 1, b: 2, c: 3}.delete_if{|key, value| value==3}
{a: 1, b: 2, c: 3}.each do |key, value|
  puts value*2
end
{a: 1, b: 2, c: 3}.transform_values!{|value| value+1}
