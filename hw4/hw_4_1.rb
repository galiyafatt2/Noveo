# Нужно реализовать класс HashWithIndifferentAccess, который позволит обращаться к ключу-строке по символу и наоборот.
# Для это следует расширить существующий класс Hash. Также добавить метод для перехода от обычного хеша к модифицированному.

# Тестовые варианты

# h = { a: 'apple' }.with_indifferent_access
# puts h['a'] # => apple
# hash[:foo] = 'bar'
# puts hash['foo']  # => bar

class HashWithIndifferentAccess < Hash
  def [](key)
    return super(key) if include?(key)
    return super(key.to_sym) if key.is_a?(String)
    return super(key) if key.is_a?(Symbol)
    return nil
  end
end
class Hash
  def with_indifferent_access
    HashWithIndifferentAccess[self]
  end
end
hash_with_indif_acc = { a: 'apple', 1 => 1 }.with_indifferent_access
puts hash_with_indif_acc[1], hash_with_indif_acc[:a], hash_with_indif_acc['a']
