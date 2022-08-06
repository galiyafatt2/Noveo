module IndifferentAccessable
  def [](key)
    return super(key) if include?(key)
    return super(key.to_sym) if include?(key&.to_sym)
    return super(key.to_s) if include?(key&.to_s)

    nil
  end
end

class Hash
  def make_indifferent_accessable!
    extend IndifferentAccessable
  end
end

hash1 = { a: 1, 'b' => 2, 1 => 3 }.make_indifferent_accessable! # можно вызвать метод так

puts hash1['a'] #=> 1
puts hash1[:b] #=> 2
puts hash1[1] #=> 3

hash2 = { d: 3, true => 'True' }
puts hash2.make_indifferent_accessable!['d'] # можно и так, сразу обращаться по ключу
puts hash2[true] #=> True

