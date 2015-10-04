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
    it "returns an integer less than or equal 9" do
      outcomes = []
      1000.times do
        outcomes << @comp.move
      end
      expect((outcomes.max <= 9)).to be(true)
    end
    it "returns an integer greater than or equal 0" do
      outcomes = []
      1000.times do
        outcomes << @comp.move
      end
      expect((outcomes.min >= 0)).to be(true)
    end
  end

end