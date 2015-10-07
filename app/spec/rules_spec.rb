require 'spec_helper'

describe Rules do
  let(:rules) { Rules.new }

  # describe '#tie?' do
  #   it 'returns false if game isn\'t over' do
  #     expect(rules.tie?([0,1,2,3,4,5,6,7,8])).to eq(false)
  #   end
  #   it 'should return false is the game is over and not a tie' do
  #     expect(rules.tie?(['X','X','O','X','O','X','X','X',8])).to eq(false)
  #   end
  #   it 'should return true is the game is over and a tie' do
  #     expect(rules.tie?(['X','O','X','O','X','O','X','O','X'])).to eq(true)
  #   end
  # end

  describe '#winner' do
    it 'returns false if there is no winner' do

    end
  end
  #   - decides who won
  #   - dictates if a move is invalid
end