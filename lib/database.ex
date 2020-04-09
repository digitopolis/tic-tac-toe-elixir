defmodule TicTacToe.Database do
  alias TicTacToe.User
  alias TicTacToe.Save
  alias TicTacToe.Repo
  alias TicTacToe.CLI

  def get_player(name) do
    TicTacToe.User |> TicTacToe.Repo.get_by( name: name ) |> TicTacToe.Repo.preload(:save)
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

  def update_save(changeset) do
    { :ok, _save } = Repo.update(changeset)
    CLI.print "Game saved"
  end

  def save_game(name, spaces) do
    user = get_player(name)
    save = %Save{ user_id: user.id, spaces: spaces }
    cond do
      user.save ->
        Save.changeset(user.save, %{ spaces: spaces })
          |> update_save
      true ->
        { :ok, _save } = TicTacToe.Repo.insert save
        CLI.print "Game saved"
    end
  end
end
