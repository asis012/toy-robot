require "./lib/command"
require "./lib/toy"
require "./lib/board"
require "./config/constant"
require "pry"

RSpec.describe Command do
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
