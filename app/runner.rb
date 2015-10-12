require_relative 'requirements/all_files'

game_hash = Hash.new

UI.start

mode = UI.get_mode
case mode
when "1"
  UI.player_info("Computer")
  UI.player_info("Computer")
when "2"
  UI.player_info("Human")
  UI.player_info("Human")
when "3"
  UI.player_info("Human")
  UI.player_info("Computer")
end

# newgame
# create players
#   type of player
#     name, type, who first, marker

# until game over

#   until player move finalized?
#     get player move
#     finalize move

#   switch players

# show winner
# play again?