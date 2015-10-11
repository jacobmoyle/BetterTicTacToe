require_relative 'rules.rb'

class Game < Rules
  attr_accessor :board # Leaving this as accessor for unit testing
  attr_reader :current_player

  def initialize(params)
    super()
    @current_player = params[:player_one]
    @next_player = params[:player_two]
    @board = [0,1,2,3,4,5,6,7,8]
  end

  def move_confirmed(params)
    if valid?(params[:move])
      @board[params[:move]] = @current_player.marker
      return true
    else
      return false
    end
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

end
