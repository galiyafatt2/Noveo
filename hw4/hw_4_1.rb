# Нужно реализовать класс HashWithIndifferentAccess, который позволит обращаться к ключу-строке по символу и наоборот.
# Для это следует расширить существующий класс Hash. Также добавить метод для перехода от обычного хеша к модифицированному.

# Тестовые варианты

# h = { a: 'apple' }.with_indifferent_access
# puts h['a'] # => apple
# hash[:foo] = 'bar'
# puts hash['foo']  # => bar

class HashWithIndifferentAccess < Hash
  def [](key) 
    key = key.is_a?(Symbol) ? key.to_s : key
    self.each { |k, value| return value if k.to_s == key }
  end
end
class Hash
  def with_indifferent_access #: return HashWithIndifferentAccess
    hash_new = HashWithIndifferentAccess.new(self)
    self.each { |key, value| hash_new[key] = value }
    hash_new
  end
end
hash_with_indif_acc = { a: 'apple', 'b': 1 }.with_indifferent_access
puts hash_with_indif_acc['a'], hash_with_indif_acc[:a], hash_with_indif_acc['b'], hash_with_indif_acc[:b]
