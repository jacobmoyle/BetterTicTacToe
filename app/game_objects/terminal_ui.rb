module UI
  def self.welcome
    system( "clear" )

    UI.print(" ______                ______                     ______                  ")
    UI.print("/\\__  _\\__            /\\__  _\\                   /\\__  _\\                 ")
    UI.print("\\/_/\\ \\/\\_\\    ___    \\/_/\\ \\/    __      ___    \\/_/\\ \\/   ___      __   ")
    UI.print("   \\ \\ \\/\\ \\  /'___\\     \\ \\ \\  /'__`\\   /'___\\     \\ \\ \\  / __`\\  /'__`\\ ")
    UI.print("    \\ \\ \\ \\ \\/\\ \\__/      \\ \\ \\/\\ \\L\\.\\_/\\ \\__/      \\ \\ \\/\\ \\L\\ \\/\\  __/ ")
    UI.print("     \\ \\_\\ \\_\\ \\____\\      \\ \\_\\ \\__/.\\_\\ \\____\\      \\ \\_\\ \\____/\\ \\____\\")
    UI.print("      \\/_/\\/_/\\/____/       \\/_/\\/__/\\/_/\\/____/       \\/_/\\/___/  \\/____/")

  end

  def self.get_mode
    UI.print( "Please choose a game type:" )
    UI.puts( "Computer v. Computer - Enter 1" )
    UI.puts( "Player v. Player - Enter 2" )
    UI.puts( "Player v. Computer - Enter 3" )
    mode = user_input

    case mode
      when "1"
        puts ""
        UI.print( "Computer v. Computer. confirmed." )
        return "1"
      when "2"
        puts ""
        UI.print( "Human v. Human confirmed." )
        return "2"
      when "3"
        puts ""
        UI.print( "Human v. Computer confirmed." )
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
    UI.print( "Enter a marker for #{playername}:" )

    return user_input
  end

  def self.get_turn_order(player1, player2)
    puts ""
    UI.print( "Which player goes first?" )
    UI.print( "#{player1} - Enter 1" )
    UI.print( "#{player2} - Enter 2" )

    choice = user_input

    case choice
      when "1"
        UI.print( "Confirmed." )
        return "1"
      when "2"
        UI.print( "Confirmed." )
        return "2"
      else # This does not consistently work atm
        UI.print( "Invalid input." )
        UI.set_turn_order
    end

  end

  def self.print_board( board )
    puts ""
    UI.print( "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_||_#{board[3]}_|_#{board[4]}_|_#{board[5]}_||_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|" )
    puts ""
  end

  def self.game_over
    puts ""
    UI.print( "============ Game Over ============" )
  end

  def self.print_move( move, player )
    puts ""
    UI.print( "#{player.name} has selected #{move}." )
    UI.print( "Board updated:" )
  end

  def self.print( string )
    puts ""
    string.split( "" ).each do |character|
      print character
      sleep( 0.025 )
    end

  end

  def self.puts( string )
    UI.print( string )
    puts ""

  end

  def self.new_player_name( default_name )
    puts ""
    UI.print( "Please provide a name for #{default_name}:" )

    return user_input
  end

  def self.user_input
    print "> "

    return gets.chomp
  end

  def self.play_again?
    UI.print( "Play Again?" )
    UI.print( "Y / N" )

    if UI.user_input == "Y"
      system( "ruby runner.rb" )
    else
      UI.print( "Goodbye." )
    end

  end

end
