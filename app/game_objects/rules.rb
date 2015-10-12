class Rules
  def initialize
    @win_lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
      [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
    ]
  end

  def gameover?
    if winner? || tie?
      return true
    else
      return false
    end
  end

  def winner?
    if @win_lines.any? { |line_indices| line_indices.all? { |index| @board[index] == @current_player.marker } }
      return true
    else
      return false
    end
  end

  def tie?
    markers = @board.uniq

    if markers.length == 2 && winner? == false
      return true
    else
      return false
    end
  end

  def valid?(move)
    if move.between?(0,8) && @board[move].class == Fixnum
      return true
    else
      return false
    end
  end

end