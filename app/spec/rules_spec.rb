require 'spec_helper'

describe Rules do
  let(:rules) { Rules.new }
  let(:player_marker) { 'X' }

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

  describe '#winner?' do
    context 'when there is no winner' do
      it 'and game isn\'t over - returns false' do
        board = [
          0,1,2,
          3,4,5,
          6,7,8
        ]
        expect(rules.winner?(board: board, marker: player_marker)).to eq(false)
      end
      it 'and game is tied - returns false' do
        board = [
          'O','X','X',
          'X','O','O',
          'O','O','X'
        ]
        expect(rules.winner?(board: board, marker: player_marker)).to eq(false)
      end
    end
    context 'when a player has won' do
      it 'returns true' do
        board = [
          'O','X','X',
          'X','O','X',
           6 ,'O','X'
        ]
        expect(rules.winner?(board: board, marker: player_marker)).to eq(true)
      end
    end
  end
  #   - decides who won
  #   - dictates if a move is invalid
end