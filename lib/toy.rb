class Toy
  attr_accessor :x_position, :y_position, :direction

  def initialize(x = nil, y = nil, f = nil)
    @x_position = x
    @y_position = y
    @direction = f
  end

  def exist?
    return !@x_position.nil? || !@y_position.nil? || !@direction.nil?
  end
end
