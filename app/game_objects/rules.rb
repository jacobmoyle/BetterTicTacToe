class Rules
  # def tie?(board)
  #   false
  # end
  def game_over?(board)
    board.any? { |spot| spot.class == String }
  end
end