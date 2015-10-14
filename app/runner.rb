require_relative 'requirements/all_files'

Ui.start
players = Hash.new

mode = Ui.get_mode
case mode
when "1"
  Ui.confirm_computer
  players[:player_one] = Ai.new(Ui.player_info("Robot 1"))
  players[:player_two] = Ai.new(Ui.player_info("Robot 2"))
when "2"
  Ui.confirm_human
  players[:player_one] = Player.new(Ui.player_info("Human 1"))
  players[:player_two] = Player.new(Ui.player_info("Human 2"))
when "3"
  Ui.confirm_humanvcomputer
  players[:player_one] = Player.new(Ui.player_info("Human"))
  players[:player_two] = Ai.new(Ui.player_info("Robot"))
end

newgame = Game.new(players)

first = Ui.get_turn_order(players)
case first
  when "1"
    Ui.tprint("Confirmed.")
    # Players switched due to #gameover? logic
    newgame.switch_players
  when "2"
    Ui.tprint("Confirmed.")
end

until newgame.gameover?
  newgame.switch_players
  Ui.print_board(newgame.board)

  move = -1
  until newgame.valid?(move)
    if newgame.current_player.class == Ai
      move = newgame.current_player.move(newgame.board)
    else
      move = Ui.get_move(newgame.current_player)
    end
  end
  Ui.confirm_move(move: move, player: newgame.current_player)
  newgame.make_move(move)
end

if newgame.winner?
  Ui.winner(newgame.current_player)
else
  Ui.tie
end

Ui.print_board(newgame.board)

Ui.play_again?