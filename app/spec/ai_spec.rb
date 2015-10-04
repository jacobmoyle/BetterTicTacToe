require 'spec_helper'

describe Ai do
  before :each do
    @comp = Ai.new(marker:"X")
  end

  it "knows its own marker" do
    expect(@comp.marker).to eq("X")
  end

end