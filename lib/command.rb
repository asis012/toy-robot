class Command

  def initialize(board, toy, command)
    @board = board
    @toy = toy
    @command = command
  end

  def place
    _, x, y, direction = @command.gsub(","," ").split
    x = x.to_i
    y = y.to_i

    
		error = validate_place_command(x,y,direction)
    return error if error.length() > 0

    @toy.x_position = x
    @toy.y_position = y
    @toy.direction = direction
  end

	def move
		puts "move"

	end

	def right

		puts "right"

	end

	def left
		puts "left"

	end

	def report
    return @toy.x_position.to_s + "," + @toy.y_position.to_s + "," + @toy.direction 
  end


  private

  def validate_place_command(x,y,direction)
    error = []
    if (x < 0)
      error << "X direction cann't be less than 0"
    end
    if (y < 0 )
      error << "Y direction cann't be less than 0"
    end 
    if (x > @board.length)
      error << "X direction is more than board size #{@board.length}"
    end
    if (y > @board.breadth) 
      error << "Y direction is more than board size #{@board.length}"
    end
    return error
  end

end
