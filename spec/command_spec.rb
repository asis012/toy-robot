require "./lib/command"
require "./lib/toy"
require "./lib/board"
require "./config/constant"
require "pry"

RSpec.describe Command do
  describe "#place" do
    board = Board.new(Constant::BOARD::LENGTH, Constant::BOARD::BREADTH)
    toy = Toy.new

    it "place toy with valid command PLACE 1,2,East" do
      command = Command.new(board, toy, "PLACE 1,2,EAST")
      error = command.place
      expect(command.toy.x_position).to eq(1)
      expect(command.toy.y_position).to eq(2)
      expect(command.toy.direction).to eq("EAST")
      expect(error).to eq("")
    end

    it "place toy with invalid x position command PLACE 10,0,NORTH" do
      command = Command.new(board, toy, "PLACE 10,2,EAST")
      error = command.place
      expect(error).to include("X position can't be 5 or more than 5")
    end

    it "place toy with invalid y position command PLACE 10,0,NORTH" do
      command = Command.new(board, toy, "PLACE 0,12,EAST")
      error = command.place
      expect(error).to include("Y position can't be 5 or more than 5")
    end

    it "place toy with invalid direction command PLACE 0,2,EASTWEST" do
      command = Command.new(board, toy, "PLACE 0,2,EASTWEST")
      error = command.place
      expect(error).to include("direction should be either NORTH or SOUTH or EAST or WEST")
    end

    it "place toy with invalid x,y,direction command PLACE -10,-10,EASTWEST" do
      command = Command.new(board, toy, "PLACE -10,-10,EASTWEST")
      error = command.place
      expect(error[0]).to include("X position can't be less than 0")
      expect(error[1]).to include("Y position can't be less than 0")
      expect(error[2]).to include("direction should be either NORTH or SOUTH or EAST or WEST")
    end
  end

  describe "#move" do
    board = Board.new(Constant::BOARD::LENGTH, Constant::BOARD::BREADTH)
    toy = Toy.new

    it "move toy which is in 1,2,EAST postion " do
      command = Command.new(board, toy, "PLACE 1,2,EAST")
      command.place
      command.move
      expect(command.toy.x_position).to eq(2)
    end

    it "move toy which is in 1,2,SOUTH postion" do
      command = Command.new(board, toy, "PLACE 1,2,SOUTH")
      command.place
      command.move
      expect(command.toy.y_position).to eq(1)
    end

    it "move empty toy without placing" do
      command = Command.new(board, nil, nil)
      error = command.move
      expect(error).to include("Cannot move the toy as it doesn't exist in board")
    end

    it "move toy which is in 4,4,SOUTH postion" do
      command = Command.new(board, Toy.new, "PLACE 4,4,EAST")
      command.place
      error = command.move
      expect(error).to include("Toy cannot move in EAST direction as it's next position doesn't exist in board")
    end

    it "move toy which is in 4,4,SOUTH postion" do
      command = Command.new(board, Toy.new, "PLACE 0,0,WEST")
      command.place
      error = command.move
      expect(error).to include("Toy cannot move in WEST direction as it's next position doesn't exist in board")
    end
  end

  describe "#report" do
    board = Board.new(Constant::BOARD::LENGTH, Constant::BOARD::BREADTH)
    it "get error report if toy isn't initialize" do
      command = Command.new(board, nil, Constant::ACTION::REPORT)
      expect(command.report).to eq("unable to get report as toy doesn't exist")
    end

    it "get error report if toy has  2 attributes only" do
      toy = Toy.new(0, 2, nil)
      command = Command.new(board, toy, Constant::ACTION::REPORT)
      expect(command.report).to eq("unable to get report as toy doesn't exist")
    end

    it "get true report for toy with all attributes" do
      toy = Toy.new(2, 2, Constant::DIRECTION::NORTH)
      command = Command.new(board, toy, Constant::ACTION::REPORT)
      expect(command.report).to eq("Output: 2,2,NORTH")
    end

    it "get false report for toy with all attributes" do
      toy = Toy.new(12, -1, Constant::DIRECTION::SOUTH)
      command = Command.new(board, toy, Constant::ACTION::REPORT)
      expect(command.report).to eq("Output: 12,-1,SOUTH")
    end
  end
end
