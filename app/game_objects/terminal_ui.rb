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
    UI.puts( "Please choose a game type:" )
    UI.puts( "Computer v. Computer - Enter 1" )
    UI.puts( "Player v. Player - Enter 2" )
    UI.puts( "Player v. Computer - Enter 3" )
    mode = user_input

    case mode
      when "1"
        UI.puts( "Computer v. Computer. confirmed." )
        return "CvC"
      when "2"
        UI.puts( "Human v. Human confirmed." )
        return "HvH"
      when "3"
        UI.puts( "Human v. Computer confirmed." )
        return "HvC"
      else
        puts "~~~~~~~~~~~~~~"
        puts "Invalid input."
        puts "~~~~~~~~~~~~~~"
        UI.get_mode
    end

  end

  def self.get_marker( playername )
    UI.puts( "Enter a marker for #{playername}:" )

    return user_input
  end

  def self.get_turn_order(player1, player2)
    UI.puts( "Which player goes first?" )
    UI.puts( "#{player1} - Enter 1" )
    UI.puts( "#{player2} - Enter 2" )

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
    UI.puts( "#{board[0]} | #{board[1]} | #{board[2]}
      ---------
      #{board[3]} | #{board[4]} | #{board[5]}
      ---------
      #{board[6]} | #{board[7]} | #{board[8]}" )
  end

  def self.game_over
    UI.puts( "============ Game Over ============" )
  end

  def self.print_move( move, player )
    UI.puts( "#{player.name} has selected #{move}." )
    UI.puts( "Board updated:" )
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
    UI.puts( "Please provide a name for #{default_name}:" )

    return user_input
  end

  def self.user_input
    print "> "

    return gets.chomp
  end

  def self.play_again?
    UI.puts( "Play Again?" )
    UI.print( "Y / N" )

    if UI.user_input == "Y"
      system( "ruby runner.rb" )
    else
      UI.print( "Goodbye." )
    end

  end

end
