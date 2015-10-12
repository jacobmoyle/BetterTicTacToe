module UI
  def self.start
    system( "clear" )

    UI.tprint(" ______                ______                     ______")
    UI.tprint("/\\__  _\\__            /\\__  _\\                   /\\__  _\\")
    UI.tprint("\\/_/\\ \\/\\_\\    ___    \\/_/\\ \\/    __      ___    \\/_/\\ \\/   ___      __")
    UI.tprint("   \\ \\ \\/\\ \\  /'___\\     \\ \\ \\  /'__`\\   /'___\\     \\ \\ \\  / __`\\  /'__`\\")
    UI.tprint("    \\ \\ \\ \\ \\/\\ \\__/      \\ \\ \\/\\ \\L\\.\\_/\\ \\__/      \\ \\ \\/\\ \\L\\ \\/\\  __/")
    UI.tprint("     \\ \\_\\ \\_\\ \\____\\      \\ \\_\\ \\__/.\\_\\ \\____\\      \\ \\_\\ \\____/\\ \\____\\")
    UI.tprint("      \\/_/\\/_/\\/____/       \\/_/\\/__/\\/_/\\/____/       \\/_/\\/___/  \\/____/")
    UI.tprint("\n")
  end

  def self.get_mode
    UI.tprint( "Please choose a game type:" )
    UI.tprint( "--------------------------" )
    UI.tprint( "Computer v. Computer - Enter 1" )
    UI.tprint( "Human v. Human - Enter 2" )
    UI.tprint( "Human v. Computer - Enter 3" )

    mode = UI.user_input
    case mode
      when "1"
        UI.tprint( "Computer v. Computer. confirmed." )
        return "1"
      when "2"
        UI.tprint( "Human v. Human confirmed." )
        return "2"
      when "3"
        UI.tprint( "Human v. Computer confirmed." )
        return "3"
    end
  end

  def self.player_info(playerType)
    info = Hash.new

    UI.tprint( "Enter a name for #{playerType}:" )
    info[:name] = UI.user_input
    UI.tprint( "Enter a marker for #{info[:name]}:" )
    info[:marker] = UI.user_input

    info
  end


#   def self.get_turn_order(player1, player2)
#     UI.tputs( "Which player goes first?" )
#     UI.tputs( "#{player1} - Enter 1" )
#     UI.tputs( "#{player2} - Enter 2" )

#     choice = user_input

#     case choice
#       when "1"
#         UI.tprint( "Confirmed." )
#         return "1"
#       when "2"
#         UI.tprint( "Confirmed." )
#         return "2"
#       else # This does not consistently work atm
#         UI.tprint( "Invalid input." )
#         UI.set_turn_order
#     end

#   end

#   def self.print_board( board )
#     UI.tputs( "#{board[0]} | #{board[1]} | #{board[2]}
#       ---------
#       #{board[3]} | #{board[4]} | #{board[5]}
#       ---------
#       #{board[6]} | #{board[7]} | #{board[8]}" )
#   end

#   def self.game_over
#     UI.tputs( "============ Game Over ============" )
#   end

#   def self.print_move( move, player )
#     UI.tputs( "#{player.name} has selected #{move}." )
#     UI.tputs( "Board updated:" )
#   end

#   def self.new_player_name( default_name )
#     UI.tputs( "Please provide a name for #{default_name}:" )

#     return user_input
#   end

#   def self.play_again?
#     UI.tputs( "Play Again?" )
#     UI.tprint( "Y / N" )

#     if UI.user_input == "Y"
#       system( "ruby runner.rb" )
#     else
#       UI.tprint( "Goodbye." )
#     end

#   end
  private

    def self.tprint( string )
      puts ""
      string.split( "" ).each do |character|
        print character
        sleep( 0.0 )
      end
    end

    def self.tputs( string )
      UI.tprint( string )
      puts ""
    end

  def self.user_input
    UI.tprint "> "
    return gets.chomp
  end

end
