require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  let(:player_marker) { 'X' }

  describe '#board' do
    it 'initializes as "empty" board with corresponding integers upon creation' do
      newgame = Game.new
      expect(newgame.board.all?{ |item| item.class == Fixnum }).to eq(true)
    end
  end

  # Inherited from Rules
  describe '#tie?' do
    it 'returns false if game isn\'t over' do
      game.board = [0,1,2,3,4,5,6,7,8]
      expect(game.tie?).to eq(false)
    end
    it 'should return false is the game is over' do
      game.board = ['X','X','O','X','O','X','X','X',8]
      expect(game.tie?).to eq(false)
    end
    it 'should return true if the game is over and a tie' do
      game.board = ['O','O','X','X','X','O','O','O','X']
      expect(game.tie?).to eq(true)
    end

  end

  describe '#winner?' do

    context 'when there is no winner' do
      it 'and game isn\'t over - returns false' do
        game.board = [0,1,2,3,4,5,6,7,8]
        expect(game.winner?(marker: player_marker)).to eq(false)
      end
      it 'and game is tied - returns false' do
        game.board = ['O','X','X','X','O','O','O','O','X']
        expect(game.winner?(marker: player_marker)).to eq(false)
      end
    end

    context 'when a player has won' do
      it 'returns true' do
        game.board = ['O','X','X','X','O','X',6 ,'O','X']
        expect(game.winner?(marker: player_marker)).to eq(true)
      end
    end

  end

  describe '#valid?' do

    context 'returns true when' do
      it 'the input is valid' do
        game.board = [0,1,2,3,4,5,6,7,8]
        expect(game.valid?(move: 0)).to eq(true)
      end
    end

    context 'returns false when' do
      it 'the input is larger than board length' do
        game.board = [0,1,2,3,4,5,6,7,8]
        expect(game.valid?(move: 9)).to eq(false)
      end
      it 'the input is smaller than the board length' do
        game.board = [0,1,2,3,4,5,6,7,8]
        expect(game.valid?(move: -5)).to eq(false)
      end
      it 'the move has been taken' do
        game.board = [0,1,2,3,'4',5,6,7,8]
        expect(game.valid?(move: 4)).to eq(false)
      end
    end

  end

end