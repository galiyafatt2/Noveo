class Shapes
  attr_reader :square

  include Comparable

  def <=>(other)
    square <=> other.square
  end
end
class Square < Shapes
  def initialize(side)
    @square = side**2
  end
end

class Rectangle < Shapes
  def initialize(width, length)
    @square = width * length
  end
end

class Triangle < Shapes
  def initialize(base, height)
    @square = base * height / 2
  end
end

class Circle < Shapes
  def initialize(radius)
    @square = radius * Math::PI
  end
end

class CustomShape < Shapes
  def initialize(square_custom)
    @square = square_custom
  end
end
shapes = [Square.new(2), Rectangle.new(2, 3), Triangle.new(3, 2), Circle.new(3), CustomShape.new(10)]

shapes.sort
