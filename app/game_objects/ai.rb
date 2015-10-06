class Ai
  attr_accessor :marker, :enemy_marker

  def initialize(hash)
    @marker = hash[:marker]
    @enemy_marker = hash[:enemy_marker]
  end

  # The higher a move scores the more likely it will be chosen.
  # Move is given a score based on the how few or many markers are on a 'line'
  # A 'line' is a method of winning. For example, given the board:

  # 0,1,2,
  # 3,4,5,
  # 6,7,8

  # 0,4,8 would be a diagonal line.

  def move(board)
    moves = [0,1,2,3,4,5,6,7,8]

    board.each_with_index do |contents, index|
      # tests if move is viable
      if contents.class == Fixnum
        # The move's points are calculated based on what 'lines' intersect it.
        case index
        when 0
          moves[index] = calculate_score([
                            [board[0],board[4],board[8]], # Row B
                            [board[0],board[1],board[2]], # Row F
                            [board[0],board[3],board[6]]  # Row D
                        ])
        when 1
          moves[index] = calculate_score([
                          [board[0],board[1],board[2]], # Row F
                          [board[1],board[4],board[7]]  # Row C
                          ])
        when 2
          moves[index] = calculate_score([
                          [board[2],board[4],board[6]], # Row A
                          [board[0],board[1],board[2]], # Row F
                          [board[2],board[5],board[8]]  # Row E
                          ])
        when 3
          moves[index] = calculate_score([
                          [board[3],board[4],board[5]], # Row G
                          [board[0],board[3],board[6]]  # Row D
                          ])
        when 4
          moves[index] = calculate_score([
                          [board[2],board[4],board[6]], # Row A
                          [board[0],board[4],board[8]], # Row B
                          [board[1],board[4],board[7]], # Row C
                          [board[3],board[4],board[5]]  # Row G
                          ])
        when 5
          moves[index] = calculate_score([
                          [board[3],board[4],board[5]], # Row G
                          [board[2],board[5],board[8]]  # Row E
                          ])
        when 6
          moves[index] = calculate_score([
                          [board[2],board[4],board[6]], # Row A
                          [board[0],board[3],board[6]], # Row D
                          [board[6],board[7],board[8]]  # Row H
                          ])
        when 7
          moves[index] = calculate_score([
                          [board[1],board[4],board[7]], # Row C
                          [board[6],board[7],board[8]]  # Row H
                          ])
        when 8
          moves[index] = calculate_score([
                          [board[6],board[7],board[8]], # Row H
                          [board[2],board[5],board[8]], # Row E
                          [board[0],board[4],board[8]]  # Row B
                          ])
        end
      # If move has already been taken, score is 0
      else
        moves[index] = 0
      end
    end
    # Purposely not worrying about handling a full board.
    moves.index(moves.max)
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

end
