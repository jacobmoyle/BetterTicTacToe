require_relative 'rules.rb'

class Game < Rules
  attr_accessor :board

  def initialize
    super
    @board = [0,1,2,3,4,5,6,7,8]
  end



end

# Game
#   - generates players
#     - sets player markers
#     - sets player names
#     - sets/updates who goes first
#   - generates an 'empty' board [done]
#   - tracks board
#   - updates board

Board tracks itself within Game
Game is actually the runner file (AKA controller)
  Rename to TerminalGame?
  Interacts with terminal
  Interacts with Player / AI
