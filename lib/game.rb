def start_game
	require 'pry'
	require_relative 'board'
	require_relative 'toy'
	require_relative 'command'
	require_relative '../config/constant'

	instruction_message = "Enter PLACE X,Y,F to place toy in x,y position with f direction \n Enter MOVE to move forward \n Enter LEFT to rotate 90 degrees by left \n Enter RIGHT to rotate 90 degrees by right \n Enter REPORT to get final state"
	puts "Welcome to the toy robot simulation."
	puts instruction_message
	puts "---------------:"
	puts "Enter inital position:"

	@board = Board.new(Constant::BOARD::LENGTH, Constant::BOARD::BREADTH)
	@toy = Toy.new
	@command = Command.new

	loop do
		command = gets.chomp

    case command
		when /^PLACE\s*\d,\d,(NORTH|SOUTH|EAST|WEST)*$/
			@command.place

		when Constant::ACTION::MOVE
			@command.move
		when Constant::ACTION::LEFT
			@command.left

		when Constant::ACTION::RIGHT
			@command.right

		when Constant::ACTION::REPORT
			@command.report

		when Constant::ACTION::EXIT
			puts "Exiting the simulation. Thank You!!!"
			break
		else
			puts "---------------:"
			puts "Invalid Instruction. Please follow below instruction \n" + instruction_message
		end
	end

end

start_game
