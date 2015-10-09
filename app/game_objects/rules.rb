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

  def valid?(params)
    if params[:move].between?(0,8) && params[:board][params[:move]].class == Fixnum
      true
    else
      false
    end
  end
end