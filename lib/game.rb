def start_game
  require 'pry'
  require_relative 'board'
  require_relative '../config/constant'

  puts "Welcome to the toy robot simulation. \n Enter PLACE X,Y,F to place toy in x,y position with f direction \n Enter MOVE to move forward \n Enter LEFT to rotate 90 degrees by left \n Enter RIGHT to rotate 90 degrees by right \n Enter REPORT to get final state "
  puts "---------------:"
  puts "Enter inital position:"

  board = Board.new(Constant::BOARD::LENGTH, Constant::BOARD::BREADTH)
  loop do
   command = gets.chomp
   break if command.eql?(Constant::ACTION::EXIT)
  end

end

start_game
