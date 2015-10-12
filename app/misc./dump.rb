#   def self.print_board( board )
#     Ui.tputs( "#{board[0]} | #{board[1]} | #{board[2]}
#       ---------
#       #{board[3]} | #{board[4]} | #{board[5]}
#       ---------
#       #{board[6]} | #{board[7]} | #{board[8]}" )
#   end

#   def self.game_over
#     Ui.tputs( "============ Game Over ============" )
#   end

#   def self.print_move( move, player )
#     Ui.tputs( "#{player.name} has selected #{move}." )
#     Ui.tputs( "Board updated:" )
#   end

#   def self.new_player_name( default_name )
#     Ui.tputs( "Please provide a name for #{default_name}:" )

#     return user_input
#   end

#   def self.play_again?
#     Ui.tputs( "Play Again?" )
#     Ui.tprint( "Y / N" )

#     if Ui.user_input == "Y"
#       system( "ruby runner.rb" )
#     else
#       Ui.tprint( "Goodbye." )
#     end

#   end