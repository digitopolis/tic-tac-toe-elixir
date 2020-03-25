defmodule TicTacToe.Game do
  alias TicTacToe.CLI
  alias TicTacToe.Player
  alias TicTacToe.Game

  defstruct [:board, players: []]

  def get_players(input \\ CLI) do
    player1 = input.get_player_name("X")
    player2 = input.get_player_name("O")
    [%Player{name: player1}, %Player{name: player2}]
  end

  def add_players(game, input \\ CLI) do
    Map.replace!(game, :players, Game.get_players(input))
  end

end
