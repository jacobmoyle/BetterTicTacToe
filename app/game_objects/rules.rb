class Rules
  def initialize
    @win_lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
      [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
    ]
  end

  def winner?(params) # Can I yield to the player marker?

    if @win_lines.any? { |line_indices| line_indices.all? { |index| params[:board][index] == params[:marker] } }
      return true
    else
      return false
    end

  end

  def tie?(params)

    markers = params[:board].uniq

    if markers.length == 2 && !(markers.any? { |marker| winner?(board: params[:board], marker: marker) })
      return true
    else
      return false
    end

  end

  # A board can have Fixnum and be over (someone won)
  # A board can be full with no winner (tie)
  # A board can be full with a winner
  # A board can have Fixnum and no winner (game not over)
end