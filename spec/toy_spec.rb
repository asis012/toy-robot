require "./lib/toy"
require 'simplecov'
SimpleCov.start do
  add_group 'lib', './lib/toy'
end

RSpec.describe Toy do
  describe "#exist?" do
    it "initialize toy with all attributes" do
      toy = Toy.new(2, 2, 'NORTH')
      expect(toy.exist?).to eq(true)
    end
    
    it "initialize toy with x and y position attributes only" do
      toy = Toy.new(2, 2)
      expect(toy.exist?).to eq(true)
    end
    
    it "initialize toy without any attributes" do
      toy = Toy.new
      expect(toy.exist?).to eq(false)
    end
  end
end
