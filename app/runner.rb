require_relative 'requirements/all_files'

Ui.start

players = Hash.new

mode = Ui.get_mode
case mode
when "1"
  Ui.confirm_computer
  players[:player_one] = Ai.new(Ui.player_info("Robot 1"))
  players[:player_two] = Ai.new(Ui.player_info("Robot 2"))
when "2"
  Ui.confirm_human
  players[:player_one] = Player.new(Ui.player_info("Human 1"))
  players[:player_two] = Player.new(Ui.player_info("Human 2"))
when "3"
  Ui.confirm_humanvcomputer
  players[:player_one] = Player.new(Ui.player_info("Human"))
  players[:player_two] = Ai.new(Ui.player_info("Robot"))
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

over = false
# until over
  until player move finalized?
#     get player move
#     finalize move
  end
#   switch players
# end

# show winner
# play again?