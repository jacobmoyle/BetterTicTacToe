require 'spec_helper'

describe Human do
  before :each do
    @player = Human.new(name: "Jacob", marker: "X")
  end

  it "has a marker" do
    expect(@player.marker).to eq("X")
  end
  it "has a name" do
    expect(@player.name).to eq("Jacob")
  end
  # - tracks own name
  # - tracks own marker
end