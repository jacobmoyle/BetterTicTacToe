require 'spec_helper'

describe Ai do
  let(:comp) { Ai.new(marker:'X', enemy_marker: 'O', name: 'Computer') }
  let(:board) { [0,1,2,3,4,5,6,7,8] }

  it 'has a marker' do
    expect(comp.marker).to eq('X')
  end
  it 'has a name' do
    expect(comp.name).to eq('Computer')
  end

  describe '#move' do
    it 'returns an index of a given array' do
      responses = []
      1000.times do
        responses << comp.move(board)
      end
      expect(responses.max <= board.length).to be(true)
      expect(responses.min >= 0).to be(true)
    end
    it 'returns 4 when available' do
      expect(comp.move(board)).to eq(4)
    end
    it 'returns a counter corner move' do
      expect(comp.move(['O',1,2,3,'X',5,6,7,8])).to eq(8)
    end
    it 'returns the winning move' do
      expect(comp.move(['X',1,'X','O','X',5,'O',7,'O'])).to eq(1)
    end
    it 'returns the blocking move' do
      expect(comp.move([0,1,'X','O','X',5,'O',7,8])).to eq(0)
    end

  end

end