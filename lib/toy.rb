class Toy
  attr_reader :x_position, :y_position, :direction

  def initialize(x, y, f)
      @x_position = x
      @y_position = y
      @direction = f
  end
end