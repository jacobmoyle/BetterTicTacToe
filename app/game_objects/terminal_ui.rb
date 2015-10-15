require 'colorize'

module Ui
  def self.start
    system("clear")

    Ui.tprint(" ______                ______                     ______".colorize(:cyan))
    Ui.tprint("/\\__  _\\__            /\\__  _\\                   /\\__  _\\".colorize(:cyan))
    Ui.tprint("\\/_/\\ \\/\\_\\    ___    \\/_/\\ \\/    __      ___    \\/_/\\ \\/   ___      __".colorize(:cyan))
    Ui.tprint("   \\ \\ \\/\\ \\  /'___\\     \\ \\ \\  /'__`\\   /'___\\     \\ \\ \\  / __`\\  /'__`\\".colorize(:cyan))
    Ui.tprint("    \\ \\ \\ \\ \\/\\ \\__/      \\ \\ \\/\\ \\L\\.\\_/\\ \\__/      \\ \\ \\/\\ \\L\\ \\/\\  __/".colorize(:cyan))
    Ui.tprint("     \\ \\_\\ \\_\\ \\____\\      \\ \\_\\ \\__/.\\_\\ \\____\\      \\ \\_\\ \\____/\\ \\____\\".colorize(:cyan))
    Ui.tprint("      \\/_/\\/_/\\/____/       \\/_/\\/__/\\/_/\\/____/       \\/_/\\/___/  \\/____/".colorize(:cyan))
    Ui.tprint("\n")
    p String.colors
  end

    def self.print_board(board)
      Ui.tputs( "#{board[0]}" + " | ".colorize(:cyan) + "#{board[1]}" + " | ".colorize(:cyan) + "#{board[2]}\n" + "---------\n".colorize(:cyan) + "#{board[3]}" + " | ".colorize(:cyan) + "#{board[4]}" + " | ".colorize(:cyan) + "#{board[5]}\n" + "---------\n".colorize(:cyan) + "#{board[6]}" + " | ".colorize(:cyan) + "#{board[7]}" + " | ".colorize(:cyan) + "#{board[8]}" )
    end

  def self.get_mode
    Ui.tprint("Please choose a game type:")
    Ui.tprint("--------------------------".colorize(:cyan))
    Ui.tprint("Computer v. Computer - Enter" + " 1".colorize(:cyan))
    Ui.tprint("Human v. Human - Enter" + " 2".colorize(:cyan))
    Ui.tprint("Human v. Computer - Enter" + " 3".colorize(:cyan))

    return Ui.user_input
  end

  def self.player_info(playerType)
    info = Hash.new

    Ui.tprint("Hence forth, #{playerType}".colorize(:cyan) + " shall be called:")
    info[:name] = Ui.user_input
    Ui.tprint("Please enter a dastardly marker for " + "#{info[:name]}:".colorize(:cyan))
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
    Ui.tprint("#{players[:player_one].name} - Enter 1")
    Ui.tprint("#{players[:player_two].name} - Enter 2")

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
    Ui.tprint("#{params[:player].name} selected position #{params[:move].to_s}.")
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
    Ui.tprint( "Y / N" )

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
