require_relative 'rules.rb'

class Game < Rules
  def initialize
    super
  end
end

# Game
#   - generates players
#     - sets player markers
#     - sets player names
#     - sets/updates who goes first
#   - generates an 'empty' board
#   - tracks board
#   - updates board