module Constant
  module DIRECTION
    NORTH = "NORTH"
    SOUTH = "SOUTH"
    EAST = "EAST"
    WEST= "WEST"
  end

  DIRECTIONS = %w[
    NORTH 
    EAST 
    SOUTH 
    WEST
  ].freeze

  module ACTION
    PLACE = "PLACE"
    MOVE = "MOVE"
    LEFT = "LEFT"
    RIGHT = "RIGHT"
    REPORT = "REPORT"
    EXIT = "EXIT"
  end

  module BOARD
    LENGTH = 5
    BREADTH = 5
  end
end