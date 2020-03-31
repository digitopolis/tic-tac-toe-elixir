defmodule TicTacToe do
  alias TicTacToe.CLI
  alias TicTacToe.Game

  def run() do
    CLI.welcome()
    game = %Game{}
      |> Game.add_players
      |> Game.add_board
      |> Game.play
  end
end
