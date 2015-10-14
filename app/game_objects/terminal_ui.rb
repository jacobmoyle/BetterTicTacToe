require 'colorize'

module Ui
  def self.start
    system("clear")

    Ui.tprint(" ______                ______                     ______")
    Ui.tprint("/\\__  _\\__            /\\__  _\\                   /\\__  _\\")
    Ui.tprint("\\/_/\\ \\/\\_\\    ___    \\/_/\\ \\/    __      ___    \\/_/\\ \\/   ___      __")
    Ui.tprint("   \\ \\ \\/\\ \\  /'___\\     \\ \\ \\  /'__`\\   /'___\\     \\ \\ \\  / __`\\  /'__`\\")
    Ui.tprint("    \\ \\ \\ \\ \\/\\ \\__/      \\ \\ \\/\\ \\L\\.\\_/\\ \\__/      \\ \\ \\/\\ \\L\\ \\/\\  __/")
    Ui.tprint("     \\ \\_\\ \\_\\ \\____\\      \\ \\_\\ \\__/.\\_\\ \\____\\      \\ \\_\\ \\____/\\ \\____\\")
    Ui.tprint("      \\/_/\\/_/\\/____/       \\/_/\\/__/\\/_/\\/____/       \\/_/\\/___/  \\/____/")
    Ui.tprint("\n")
  end

    def self.print_board(board)
      Ui.tputs( "
        #{board[0]} | #{board[1]} | #{board[2]}
        ---------
        #{board[3]} | #{board[4]} | #{board[5]}
        ---------
        #{board[6]} | #{board[7]} | #{board[8]}" )
    end

  def self.get_mode
    Ui.tprint("Please choose a game type:")
    Ui.tprint("--------------------------")
    Ui.tprint("Computer v. Computer - Enter 1")
    Ui.tprint("Human v. Human - Enter 2")
    Ui.tprint("Human v. Computer - Enter 3")

    return Ui.user_input
  end

  def self.player_info(playerType)
    info = Hash.new

    Ui.tprint("Hence forth, #{playerType} shall be called:")
    info[:name] = Ui.user_input
    Ui.tprint("Please enter a dastardly icon for #{info[:name]}:")
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
    Ui.tprint("Board updated.")
  end

  def self.winner(player)
    Ui.tputs("\n***********************")
    Ui.tprint("#{player.name} has won!")
  end

  def self.tie
    Ui.tputs("\n********************")
    Ui.tprint("Cats game! Womp womp.")
  end

  def self.play_again?
    Ui.tprint( "Play Again?" )
    Ui.tprint( "Y / N" )

    if Ui.user_input.downcase == "y"
      system( "ruby runner.rb" )
    else
      Ui.tprint( "Goodbye." )
    end

  end

  private

  def self.tprint(string)
    puts ""
    string.split("" ).each do |character|
      print character.colorize(:blue)
      sleep(0.002)
    end
  end

  def self.tputs(string)
    Ui.tprint(string)
    puts ""
  end

  def self.user_input
    Ui.tprint("> ")
    return gets.chomp
  end

end
