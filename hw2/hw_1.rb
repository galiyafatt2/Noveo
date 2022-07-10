# frozen_string_literal: true

def or_sum(n)
  c = 0
  s = 0
  while c <= n
    s |= c
    c += 1
  end
  s
end

puts or_sum(7)
