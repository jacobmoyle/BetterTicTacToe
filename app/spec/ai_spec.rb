require 'spec_helper'

describe Ai do
  before :each do
    @comp = Ai.new(marker:"X", enemy_marker: "O")
    @board = [0,1,2,3,4,5,6,7,8]
  end

  it "knows its own marker" do
    expect(@comp.marker).to eq("X")
  end

  it "knows the opponents marker" do
    expect(@comp.enemy_marker).to eq("O")
  end

  describe "#move" do
    it "returns an index of a given array" do
      responses = []
      1000.times do
        responses << @comp.move(@board)
      end
      expect(responses.max <= @board.length).to be(true)
      expect(responses.min >= 0).to be(true)
    end
    it "returns 4 when available" do
      expect(@comp.move(@board)).to eq(4)
    end
  end

end