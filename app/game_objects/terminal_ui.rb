module UI
  def self.welcome
    system( "clear" )

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "|      Ultimate Tic Tac Toe       |"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def self.get_mode
    puts ""
    UI.terminal_print( "Please choose a game type:\n" )
    UI.terminal_print( "Computer v. Computer - Enter 1\n" )
    UI.terminal_print( "Player v. Player - Enter 2\n" )
    UI.terminal_print( "Player v. Computer - Enter 3" )
    mode = user_input

    case mode
      when "1"
        puts ""
        UI.terminal_print( "Computer v. Computer. confirmed.\n" )
        return "1"
      when "2"
        puts ""
        UI.terminal_print( "Human v. Human confirmed.\n" )
        return "2"
      when "3"
        puts ""
        UI.terminal_print( "Human v. Computer confirmed.\n" )
        return "3"
      else
        puts "~~~~~~~~~~~~~~"
        puts "Invalid input."
        puts "~~~~~~~~~~~~~~"
        UI.get_mode
    end

  end

  def self.get_marker( playername )
    puts ""
    UI.terminal_print( "Enter a marker for #{playername}:" )

    return user_input
  end

  def self.get_turn_order(player1, player2)
    puts ""
    UI.terminal_print( "Which player goes first?\n" )
    UI.terminal_print( "#{player1} - Enter 1\n" )
    UI.terminal_print( "#{player2} - Enter 2" )

    choice = user_input

    case choice
      when "1"
        UI.terminal_print( "Confirmed.\n" )
        return "1"
      when "2"
        UI.terminal_print( "Confirmed.\n" )
        return "2"
      else # This does not consistently work atm
        UI.terminal_print( "Invalid input.\n" )
        UI.set_turn_order
    end

  end

  def self.print_board( board )
    puts ""
    UI.terminal_print( "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_|\n|_#{board[3]}_|_#{board[4]}_|_#{board[5]}_|\n|_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|\n" )
    puts ""
  end

  def self.game_over
    puts ""
    UI.terminal_print( "============ Game Over ============\n" )
  end

  def self.print_move( move, player )
    puts ""
    UI.terminal_print( "#{player.name} has selected #{move}.\n" )
    UI.terminal_print( "Board updated:\n" )
  end

  def self.terminal_print( string )
    string.split( "" ).each do |character|
      print character
      sleep( 0.025 )
    end

  end

  def self.new_player_name( default_name )
    puts ""
    UI.terminal_print( "Please provide a name for #{default_name}:" )

    return user_input
  end

  def self.user_input
    print "\n> "

    return gets.chomp
  end

  def self.play_again?
    UI.terminal_print( "Play Again?\n" )
    UI.terminal_print( "Y / N" )

    if UI.user_input == "Y"
      system( "ruby runner.rb" )
    else
      UI.terminal_print( "Goodbye.\n" )
    end

  end

end
