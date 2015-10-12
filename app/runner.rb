require_relative 'requirements/all_files'

Ui.start

players = Hash.new

mode = Ui.get_mode
case mode
when "1"
  Ui.confirm_computer
  players[:player_one] = Ai.new(Ui.player_info("Computer 1"))
  players[:player_two] = Ai.new(Ui.player_info("Computer 2"))
when "2"
  Ui.confirm_human
  players[:player_one] = Player.new(Ui.player_info("Player 1"))
  players[:player_two] = Player.new(Ui.player_info("Player 2"))
when "3"
  Ui.confirm_humanvcomputer
  players[:player_one] = Player.new(Ui.player_info("Player 1"))
  players[:player_two] = Ai.new(Ui.player_info("Computer"))
end

newgame = Game.new(players)

first = Ui.get_turn_order(players)
case first
  when "1"
    Ui.tprint("Confirmed.")
  when "2"
    Ui.tprint("Confirmed.")
    newgame.switch_players
end

# until game over

#   until player move finalized?
#     get player move
#     finalize move

#   switch players

# show winner
# play again?