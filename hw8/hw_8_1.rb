module Tryable
  def try(&block)
    block.call(self)
  rescue NoMethodError
    nil
  end
end

include Tryable

p false.try { even? } # nil
p false.try(&:even?) # nil
p 2.try(&:even?) # true
p 1.try { |obj| obj + 1 } # 2
p true.try { |obj| obj + 1 } # nil
1.try { |obj| obj + '' } # it still should raise error “String can't be coerced into Integer”
