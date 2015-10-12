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

    Ui.tprint("Enter a name for #{playerType}:")
    info[:name] = Ui.user_input
    Ui.tprint("Enter a marker for #{info[:name]}:")
    info[:marker] = Ui.user_input

    info
  end

  def self.confirm_computer
    Ui.tprint("Computer v. Computer. confirmed.")
  end
  def self.confirm_human
    Ui.tprint("Human v. Human confirmed.")
  end
  def self.confirm_humanvcomputer
    Ui.tprint("Human v. Computer confirmed.")
  end

  def self.get_turn_order(players)
    Ui.tprint("Which player goes first?")
    Ui.tprint("#{players[:player_one].name} - Enter 1")
    Ui.tprint("#{players[:player_two].name} - Enter 2")

    Ui.user_input
  end

  private

  def self.tprint(string)
    puts ""
    string.split("" ).each do |character|
      print character
      sleep(0.0)
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
