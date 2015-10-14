require_relative 'player'

class Ai < Player
  attr_accessor :enemy_marker

  def initialize(params)
    super
    @enemy_marker = params.fetch([:enemy_marker], nil)
  end

  # The higher a move scores the more likely it will be chosen.
  # Move is given a score based on the how few or many markers are on a 'line'
  # For example, given the board:

  # 0,1,2,
  # 3,4,5,
  # 6,7,8

  # 0,4,8 would be a Left Diagonal line.

  def move(board)
    @enemy_marker ||= find_enemy(board)
    move = corner_counter(board)

    moves = [0,1,2,3,4,5,6,7,8]

    board.each_with_index do |contents, index|
      # tests if move is viable
      if contents.class == Fixnum
        # The move's points are calculated based on what 'lines' intersect it.
        case index
        # The following array calls are confusing. Need to refactor, call them 'diagonal-left' for example.
        when 0
          moves[index] = calculate_score([
                            [board[0],board[4],board[8]], # Top Row
                            [board[0],board[1],board[2]], # Middle Column
                            [board[0],board[3],board[6]]  # Bottom Row
                        ])
        when 1
          moves[index] = calculate_score([
                          [board[0],board[1],board[2]], # Middle Column
                          [board[1],board[4],board[7]]  # Middle Row
                          ])
        when 2
          moves[index] = calculate_score([
                          [board[2],board[4],board[6]], # Left Diagonal
                          [board[0],board[1],board[2]], # Middle Column
                          [board[2],board[5],board[8]]  # Right Column
                          ])
        when 3
          moves[index] = calculate_score([
                          [board[3],board[4],board[5]], # Left Column
                          [board[0],board[3],board[6]]  # Bottom Row
                          ])
        when 4
          moves[index] = calculate_score([
                          [board[2],board[4],board[6]], # Left Diagonal
                          [board[0],board[4],board[8]], # Top Row
                          [board[1],board[4],board[7]], # Middle Row
                          [board[3],board[4],board[5]]  # Left Column
                          ])
        when 5
          moves[index] = calculate_score([
                          [board[3],board[4],board[5]], # Left Column
                          [board[2],board[5],board[8]]  # Right Column
                          ])
        when 6
          moves[index] = calculate_score([
                          [board[2],board[4],board[6]], # Left Diagonal
                          [board[0],board[3],board[6]], # Bottom Row
                          [board[6],board[7],board[8]]  # Right Diagnol
                          ])
        when 7
          moves[index] = calculate_score([
                          [board[1],board[4],board[7]], # Middle Row
                          [board[6],board[7],board[8]]  # Right Diagnol
                          ])
        when 8
          moves[index] = calculate_score([
                          [board[6],board[7],board[8]], # Right Diagnol
                          [board[2],board[5],board[8]], # Right Column
                          [board[0],board[4],board[8]]  # Top Row
                          ])
        end
      # If move has already been taken, score is 0
      else
        moves[index] = 0
      end
    end
    # Purposely not worrying about handling a full board.
    move ||= moves.index(moves.max)
  end

  private

  def calculate_score(lines)
    score = 0

    lines.each do |row|
      # 2 comp + blank in row
      if row.count(@marker) == 2
        score += 30
      # enemy + enemy + blank in row
      elsif row.count(@enemy_marker) == 2
        score += 15
      # comp + enemy + blank in row
      elsif row.count(@marker) == 1 && row.count(@enemy_marker) == 1
        score += 5
      # comp + 2 blank in row
      elsif row.count(@marker) == 1
        score += 4
      # blank or only enemy in row
      else
        score += 1
      end
    end

    score
  end

  def corner_counter(board)
    if board == [@enemy_marker,1,2,3,@marker,5,6,7,@enemy_marker] || board == [0,1,@enemy_marker,3,@marker,5,@enemy_marker,7,8]
      return 3
    end
  end

  def find_enemy(board)
    board.each do |spot|
      if spot.class == String && spot != @marker
        return spot
      end
    end
  end

end
