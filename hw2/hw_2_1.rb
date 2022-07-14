# frozen_string_literal: true

def or_sum(n)
  sum = 0
  (n+1).times do |counter|
    sum |= counter
  end
  sum
end

puts or_sum(4)
