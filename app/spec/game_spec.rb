require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  let(:player_marker) { 'X' }

  describe '#tie?' do

    it 'returns false if game isn\'t over' do
      expect(game.tie?(board: [0,1,2,3,4,5,6,7,8])).to eq(false)
    end
    it 'should return false is the game is over' do
      expect(game.tie?(board: ['X','X','O','X','O','X','X','X',8])).to eq(false)
      expect(game.tie?(board: ['X','X','O','X','O','X','X','X','O'])).to eq(false)
    end
    it 'should return true if the game is over and a tie' do
      expect(game.tie?(board: ['O','O','X','X','X','O','O','O','X'])).to eq(true)
    end

  end

  describe '#winner?' do

    context 'when there is no winner' do
      it 'and game isn\'t over - returns false' do
        expect(game.winner?(board: [0,1,2,3,4,5,6,7,8], marker: player_marker)).to eq(false)
      end
      it 'and game is tied - returns false' do
        expect(game.winner?(board: ['O','X','X','X','O','O','O','O','X'], marker: player_marker)).to eq(false)
      end
    end

    context 'when a player has won' do
      it 'returns true' do
        expect(game.winner?(board: ['O','X','X','X','O','X',6 ,'O','X'], marker: player_marker)).to eq(true)
      end
    end

  end

  describe '#valid?' do

    context 'returns true when' do
      it 'the input is valid' do
        expect(game.valid?(move: 0, board: [0,1,2,3,4,5,6,7,8])).to eq(true)
      end
    end

    context 'returns false when' do
      it 'the input is larger than board length' do
        expect(game.valid?(move: 9, board: [0,1,2,3,4,5,6,7,8])).to eq(false)
      end
      it 'the input is smaller than the board length' do
        expect(game.valid?(move: -5, board: [0,1,2,3,4,5,6,7,8])).to eq(false)
      end
      it 'the move has been taken' do
        expect(game.valid?(move: 4, board: [0,1,2,3,'4',5,6,7,8])).to eq(false)
      end
    end

  end

end