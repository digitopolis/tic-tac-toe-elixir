defmodule TicTacToe do
  alias TicTacToe
  alias TicTacToe.CLI
  alias TicTacToe.Game

  def run() do
    CLI.welcome()
    play()
  end

  def play() do
    game = %Game{}
      |> Game.add_players
      |> Game.add_board
      |> Game.play
  end
end
