defmodule TicTacToe.Database do
  alias TicTacToe.User

  def get_player(name) do
    TicTacToe.User |> TicTacToe.Repo.get_by( name: name )
  end

  def new_player(name) do
    player = %User{ name: name, wins: 0 }
    { :ok, player } = TicTacToe.Repo.insert player
    player
  end
end
