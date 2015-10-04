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
  attr_accessor :marker
  def initialize(hash)
    @marker = hash[:marker]
  end
end