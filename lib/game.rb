require_relative "board"
require_relative "toy"
require_relative "command"
require_relative "../config/constant"

def start_game
  instruction_message = " Enter PLACE X,Y,F to place Toy in x,y position with f direction \n Enter MOVE to move forward \n Enter LEFT to rotate 90 degrees by left \n Enter RIGHT to rotate 90 degrees by right \n Enter REPORT to get final postion of Toy"
  puts "Welcome to the Toy robot simulation."
  puts instruction_message
  puts "---------------:"
  puts "Enter inital position:"

  @board = Board.new(Constant::BOARD::LENGTH, Constant::BOARD::BREADTH)
  @toy = Toy.new

  loop do
    command = gets.chomp
    @command = Command.new(@board, @toy, command)
    case command
    when /^PLACE\s*\d,\d,(NORTH|SOUTH|EAST|WEST)*$/
      error = @command.place
      puts "ERROR: #{error}" if error.is_a?(Array) && error.length > 0

    when Constant::ACTION::MOVE
      error = @command.move
      puts "ERROR: #{error}" if error.is_a?(Array) && error.length > 0

    when Constant::ACTION::LEFT
      error = @command.left
      puts "ERROR: #{error}" if error != ""

    when Constant::ACTION::RIGHT
      error = @command.right
      puts "ERROR: #{error}" if error != ""
    when Constant::ACTION::REPORT
      puts @command.report

    when Constant::ACTION::EXIT
      puts "Exiting the simulation. Thank You!!!"
      break
    else
      puts "---------------:"
      puts "Invalid Instruction. Please follow below instruction \n" + instruction_message
      puts "---------------:"

    end
  end
end

start_game
