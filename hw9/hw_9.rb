
class Square
  attr_reader :square

  def initialize(side)
    @square = side**2
  end
end

class Rectangle
  attr_reader :square

  def initialize(width, length)
    @square = width * length
  end
end

class Triangle
  attr_reader :square

  def initialize(base, height)
    @square = base * height / 2
  end
end

class Circle
  attr_reader :square

  def initialize(radius)
    @square = radius * Math::PI
  end
end

class CustomShape
  attr_reader :square

  def initialize(square_custom)
    @square = square_custom
  end
end
shapes = [Square.new(2), Rectangle.new(2, 3), Triangle.new(3, 2), Circle.new(3), CustomShape.new(10)]

shapes.sort { |a, b| a.square <=> b.square }
