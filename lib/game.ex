defmodule TicTacToe.Game do
  alias TicTacToe.CLI
  alias TicTacToe.Player
  alias TicTacToe.Game
  alias TicTacToe.Board

  defstruct [:board, players: []]

  def get_players(input \\ CLI) do
    player1 = Player.new(input.get_player_name("X"), 1)
    player2 = Player.new(input.get_player_name("O"), 2)
    [player1, player2]
  end

  def current_player(game) do
    Enum.at(game.players, 0)
  end

  def switch_players(game) do
    update_in(game, [Access.key(:players)], &(Enum.reverse(&1)))
  end

  def add_players(game, input \\ CLI) do
    Map.replace!(game, :players, Game.get_players(input))
  end

  def add_board(game) do
    Map.replace!(game, :board, Board.new(3))
  end

  end

  def player_turn(game) do
    [ current_player | _tail ] = game.players
    CLI.display_board(game.board)
    move = CLI.get_player_move(current_player.name)
    new_game = Game.make_move(game, move)
    CLI.display_board(new_game.board)
  end

end
