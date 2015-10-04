=begin

It will be assumed that the board will be an array where available moves are empty and taken if containing a string

decide if spot is 'empty'
- If empty, calculate and save 'score' and spot based on the 'win lines' of the spot


### How to calculate score of row ###

ai will have a score keeper for each 'win line'.
- A B C D E F G H

Row - Indices
A   - 2,4,6
B   - 0,4,8
C   - 1,4,7
D   - 0,3,6
E   - 2,5,8
F   - 0,1,2
G   - 3,4,5
H   - 6,7,8

Point opportunities for each row:
1pt  - blank or only enemy in row
5pt  - comp + enemy + blank in row
4pt  - comp + 2 blank in row
15pt - enemy + enemy + blank in row
30pt - 2 comp + blank in row

ai will return the index of the best move

=end

=begin

Once I decided on a basic pattern of calculation, I could have solved time

=end

class Ai
  attr_accessor :marker, :enemy_marker

  def initialize(hash)
    @marker = hash[:marker]
    @enemy_marker = hash[:enemy_marker]
  end

  def move(board)
    board.each_with_index do |contents, index|
      p "Contents: #{contents}"
      # tests if spot is empty
      if contents.class == Fixnum
        # The spots points are calculated based on what rows it belongs to
        case index
        when 0
          calculate_score([
            [board[0],board[4],board[8]], # Row B
            [board[0],board[1],board[2]], # Row F
            [board[0],board[3],board[6]]  # Row D
            ])
        when 1
          calculate_score([
            [board[0],board[1],board[2]], # Row F
            [board[1],board[4],board[7]]  # Row C
            ])
        when 2
          calculate_score([
            [board[2],board[4],board[6]], # Row A
            [board[0],board[1],board[2]], # Row F
            [board[2],board[5],board[8]]  # Row E
            ])
        when 3
          calculate_score([
            [board[3],board[4],board[5]], # Row G
            [board[0],board[3],board[6]]  # Row D
            ])
        when 4
          calculate_score([
            [board[2],board[4],board[6]], # Row A
            [board[0],board[4],board[8]], # Row B
            [board[1],board[4],board[7]], # Row C
            [board[3],board[4],board[5]]  # Row G
            ])
        when 5
          calculate_score([
            [board[3],board[4],board[5]], # Row G
            [board[2],board[5],board[8]]  # Row E
            ])
        when 6
          calculate_score([
            [board[2],board[4],board[6]], # Row A
            [board[0],board[3],board[6]], # Row D
            [board[6],board[7],board[8]]  # Row H
            ])
        when 7
          calculate_score([
            [board[1],board[4],board[7]], # Row C
            [board[6],board[7],board[8]]  # Row H
            ])
        when 8
          calculate_score([
            [board[6],board[7],board[8]], # Row H
            [board[2],board[5],board[8]], # Row E
            [board[0],board[4],board[8]]  # Row B
            ])
        end
      end
    end
  end

  private

  def calculate_score(lines)
    p ""
    p "*"*20
    p "calc row: #{lines}"

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

    p ""
    p "Score is: #{score}"
    p "*"*50
  end

end

ai = Ai.new(marker:"X", enemy_marker: "O")
ai.move([
  0,1,2,
  3,"X",5,
  6,7,8
  ])