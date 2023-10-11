class Command
  attr_accessor :board, :toy, :command

  def initialize(board, toy, command)
    @board = board
    @toy = toy
    @command = command
  end

  # place the toy robot on the table in position X, Y and facing NORTH, SOUTH, EAST, or WEST
  def place
    _, x, y, direction = @command.tr(",", " ").split
    x = x.to_i
    y = y.to_i

    error = validate_place_command(x, y, direction)
    return error if error.length > 0

    @toy.x_position = x
    @toy.y_position = y
    @toy.direction = direction
    return ""
  end

  # move the toy robot one unit forward in the direction it is currently facing.
  def move
    error = validate_move_command
    return error if error.length > 0

    case @toy.direction
    when Constant::DIRECTION::EAST
      @toy.x_position += 1
    when Constant::DIRECTION::WEST
      @toy.x_position -= 1
    when Constant::DIRECTION::NORTH
      @toy.y_position += 1
    when Constant::DIRECTION::SOUTH
      @toy.y_position -= 1
    end
  end

  # right will rotate the robot 90 degrees in clockwise direction without changing the position of the robot.
  def right
    current_direction = @toy.direction
    new_direction_index = (Constant::DIRECTIONS.index(current_direction) + 1) % Constant::DIRECTIONS.length
    @toy.direction = Constant::DIRECTIONS[new_direction_index]
  end

  # left will rotate the robot 90 degrees in anit-clockwise direction without changing the position of the robot.
  def left
    current_direction = @toy.direction
    new_direction_index = (Constant::DIRECTIONS.index(current_direction) - 1) % Constant::DIRECTIONS.length
    @toy.direction = Constant::DIRECTIONS[new_direction_index]
  end

  # reprot will announce the X, Y and orientation of the robot.
  def report
    return "unable to get report as toy doesn't exist" if toy.nil? || !@toy.exist?
    "Output: #{@toy.x_position},#{@toy.y_position},#{@toy.direction}"
  end

  private

  def validate_place_command(x, y, direction)
    error = []
    if x < 0
      error << "X direction cann't be less than 0"
    end
    if y < 0
      error << "Y direction cann't be less than 0"
    end
    if x > @board.length
      error << "X direction is more than board size #{@board.length}"
    end
    if y > @board.breadth
      error << "Y direction is more than board size #{@board.length}"
    end
    if !Constant::DIRECTIONS.include?(direction)
      error << "direction should be NORTH,SOUTH,EAST,WEST"
    end
    error
  end

  def validate_move_command
    error = []
    unless @toy.exist?
      error << "Cannot move the toy as it doesn't exist in board"
    end

    if @toy.direction.eql?(Constant::DIRECTION::EAST) && @toy.x_position >= @board.length
      error << "Toy cannot move in #{@toy.direction} direction as it's next position doesn't exist in board"
    elsif @toy.direction.eql?(Constant::DIRECTION::WEST) && @toy.x_position <= 0
      error << "Toy cannot move in #{@toy.direction} direction as it's next position doesn't exist in board"
    elsif @toy.direction.eql?(Constant::DIRECTION::NORTH) && @toy.y_position >= @board.breadth
      error << "Toy cannot move in #{@toy.direction} direction as it's next position doesn't exist in board"
    elsif @toy.direction.eql?(Constant::DIRECTION::SOUTH) && @toy.y_position <= 0
      error << "Toy cannot move in #{@toy.direction} direction as it's next position doesn't exist in board"
    end
    error
  end
end
