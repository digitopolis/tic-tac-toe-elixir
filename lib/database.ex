defmodule TicTacToe.Database do
  alias TicTacToe.User
  alias TicTacToe.Repo
  alias TicTacToe.CLI

  def get_player(name) do
    TicTacToe.User |> TicTacToe.Repo.get_by( name: name )
  end

  def new_player(name) do
    player = %User{ name: name, wins: 0 }
    { :ok, player } = TicTacToe.Repo.insert player
    player
  end

  def add_win(name) do
    user = get_player(name)
    User.changeset(user, %{ wins: user.wins + 1 })
      |> update_user
  end

  def update_user(changeset) do
    {:ok, user} = Repo.update(changeset)
    CLI.print "Congratulations #{user.name}, that brings your win total to #{user.wins}"
  end
end
