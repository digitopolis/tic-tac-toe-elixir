defmodule TicTacToe.Game do
  alias TicTacToe.CLI
  alias TicTacToe.Player
  alias TicTacToe.Game

  defstruct [:board, players: []]

  def get_players(input \\ CLI) do
    player1 = Player.new(input.get_player_name("X"), 1)
    player2 = Player.new(input.get_player_name("O"), 2)
    [player1, player2]
  end

  def add_players(game, input \\ CLI) do
    Map.replace!(game, :players, Game.get_players(input))
  end

end
