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

end