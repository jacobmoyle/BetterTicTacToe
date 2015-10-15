require 'colorize'

module Ui
  def self.start
    system("clear")

    Ui.tprint(" ______                ______                     ______".colorize(:light_cyan))
    Ui.tprint("/\\__  _\\__            /\\__  _\\                   /\\__  _\\".colorize(:light_cyan))
    Ui.tprint("\\/_/\\ \\/\\_\\    ___    \\/_/\\ \\/    __      ___    \\/_/\\ \\/   ___      __".colorize(:light_cyan))
    Ui.tprint("   \\ \\ \\/\\ \\  /'___\\     \\ \\ \\  /'__`\\   /'___\\     \\ \\ \\  / __`\\  /'__`\\".colorize(:light_cyan))
    Ui.tprint("    \\ \\ \\ \\ \\/\\ \\__/      \\ \\ \\/\\ \\L\\.\\_/\\ \\__/      \\ \\ \\/\\ \\L\\ \\/\\  __/".colorize(:light_cyan))
    Ui.tprint("     \\ \\_\\ \\_\\ \\____\\      \\ \\_\\ \\__/.\\_\\ \\____\\      \\ \\_\\ \\____/\\ \\____\\".colorize(:light_cyan))
    Ui.tprint("      \\/_/\\/_/\\/____/       \\/_/\\/__/\\/_/\\/____/       \\/_/\\/___/  \\/____/".colorize(:light_cyan))
    Ui.tprint("\n")
  end

  def self.print_board(board)
    Ui.tputs( "#{board[0]}" + " | ".colorize(:light_cyan) + "#{board[1]}" + " | ".colorize(:light_cyan) + "#{board[2]}\n" + "---------\n".colorize(:light_cyan) + "#{board[3]}" + " | ".colorize(:light_cyan) + "#{board[4]}" + " | ".colorize(:light_cyan) + "#{board[5]}\n" + "---------\n".colorize(:light_cyan) + "#{board[6]}" + " | ".colorize(:light_cyan) + "#{board[7]}" + " | ".colorize(:light_cyan) + "#{board[8]}" )
  end

  def self.get_mode
    Ui.tprint("Please choose a game type:")
    Ui.tprint("--------------------------".colorize(:light_cyan))
    Ui.tprint("Computer v. Computer - Enter" + " 1".colorize(:light_cyan))
    Ui.tprint("Human v. Human - Enter" + " 2".colorize(:light_cyan))
    Ui.tprint("Human v. Computer - Enter" + " 3".colorize(:light_cyan))

    return Ui.user_input
  end

  def self.player_info(playerType)
    info = Hash.new

    Ui.tprint("Hence forth, " + "#{playerType}".colorize(:light_cyan) + " shall be referred to as...")
    info[:name] = Ui.user_input
    Ui.tprint("Please enter a marker for " + "#{info[:name]}:".colorize(:light_cyan))
    info[:marker] = Ui.user_input

    info
  end

  def self.confirm_computer
    Ui.tprint("Computer v. Computer selected.")
  end

  def self.confirm_human
    Ui.tprint("Human v. Human selected.")
  end

  def self.confirm_humanvcomputer
    Ui.tprint("Human v. Computer selected.")
  end

  def self.get_turn_order(players)
    Ui.tprint("Which player goes first?")
    Ui.tprint("#{players[:player_one].name}".colorize(:light_cyan) + " - Enter 1")
    Ui.tprint("#{players[:player_two].name}".colorize(:red) + " - Enter 2")

    Ui.user_input
  end

  def self.get_move(player)
    move = nil
    until ["0","1","2","3","4","5","6","7","8"].include?(move)
      Ui.tprint("#{player.name} - Please enter a valid move (value):")
      move = Ui.user_input
    end

    move.to_i
  end

  def self.confirm_move(params)
    Ui.tputs("#{params[:player].name} selected position #{params[:move].to_s}.")
    10.times do
      print ".".colorize(:light_cyan)
      sleep(0.2)
    end
    Ui.tputs("Board updated.")
  end

  def self.winner(player)
    Ui.tputs("\n***********************").colorize(:red)
    Ui.puts("#{player.name} has won!")
  end

  def self.tie
    Ui.tputs("\n********************".colorize(:red))
    Ui.tputs("Cats game! Womp womp.")
  end

  def self.play_again?
    Ui.tprint( "Play Again?" )
    Ui.tprint( "Y / " + "N".colorize(:red) )

    if Ui.user_input.downcase == "y"
      system( "ruby runner.rb" )
    else
      Ui.tputs( "Goodbye." )
    end

  end

  private

  def self.tprint(string)
    puts ""
    string.split("" ).each do |character|
      print character
      sleep(0.002)
    end
  end

  def self.tputs(string)
    Ui.tprint(string)
    puts ""
  end

  def self.user_input
    Ui.tprint("> ".colorize(:red))
    return gets.chomp
  end

end
