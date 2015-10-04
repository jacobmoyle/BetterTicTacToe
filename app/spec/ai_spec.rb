require 'spec_helper'

describe Ai do
  before :each do
    @comp = Ai.new(marker:"X", enemy_marker: "O")
  end

  it "knows its own marker" do
    expect(@comp.marker).to eq("X")
  end

  it "knows the opponents marker" do
    expect(@comp.enemy_marker).to eq("O")
  end

  describe "#move" do
    it "returns an index of a given array" do
      array = ["T","T","T"]
      responses = []
      1000.times do
        responses << @comp.move(array)
      end
      expect(responses.max <= array.length).to be(true)
      expect(responses.min >= 0).to be(true)
    end
  end

end