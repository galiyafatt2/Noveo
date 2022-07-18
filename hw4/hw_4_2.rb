# Нужно реализовать класс Vector с соответствующими методами по сложению,
# вычитанию векторов. Если оперируемые векторы разной длины, то это должна быть ошибка или nil результат.

# Тестовые варианты

# a = Vector.new([1, 2, 3])
# b = Vector.new([3, 4, 5])
# c = Vector.new([5, 6, 7, 8])

# a.add(b)      # should return a new Vector([4, 6, 8])
# a.subtract(b) # should return a new Vector([-2, -2, -2])
# a.dot(b)      # should return 1*3 + 2*4 + 3*5 = 26
# a.norm()      # should return sqrt(1^2 + 2^2 + 3^2) = sqrt(14)
# a.add(c)      # throws an nil
# a.to_s        # (1, 2, 3)

class Vector
  attr_reader :vector
  def initialize(vector)
    @vector = vector

  end

  #inplace
  def add(other)
   unless same_size?(other)
      return nil
    end
    res = Vector.new(vector.dup)
    (vector.size).times { |i|
      res.vector[i] = vector[i] + other.vector[i]
    }
    res.vector
  end

  def subtract(other)
    unless same_size?(other)
      return nil
    end
    res = Vector.new(vector.dup)
    (vector.size).times { |i|
      res.vector[i] = vector[i] - other.vector[i]
    }
    res.vector
  end

  def dot(other)
    unless same_size?(other)
      return nil
    end
    res = 0
    (vector.size).times { |i|
      res += vector[i] * other.vector[i]
    }
    res
  end

  def to_str
    '(' + vector.join(', ') + ')'
  end

  def norm
    res = 0
    vector.each{ |elem| res += elem ** 2 }

    Math.sqrt(res)
  end

  private
    def same_size?(other)
      vector.size == other.vector.size
    end
end

a = Vector.new([1, 2, 3])
b = Vector.new([3, 4, 5])
c = Vector.new([5, 6, 7, 8])
#p a.add(b)
#p a.subtract(b)
#p a.dot(b)
#p a.norm
#p a.add(c)
#p a.to_str
