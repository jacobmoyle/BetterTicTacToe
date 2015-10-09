require 'spec_helper'

describe Player do
  let(:player) { Player.new(name: "Jacob", marker: "X") }

  it "has a marker" do
    expect(player.marker).to eq("X")
  end
  it "has a name" do
    expect(player.name).to eq("Jacob")
  end
end