defmodule TicTacToe.Database do
  alias TicTacToe.User
  alias TicTacToe.Save
  alias TicTacToe.Repo
  alias TicTacToe.CLI

  def get_player(name, user \\ User, repo \\ Repo) do
    user |> repo.get_by( name: name ) |> repo.preload(:save)
  end

  def new_player(name, repo \\ Repo) do
    player = %User{ name: name, wins: 0 }
    { :ok, player } = repo.insert player
    player
  end

  def add_win(name, user \\ User, repo \\ Repo) do
    player = get_player(name, User, repo)
    user.changeset(player, %{ wins: player.wins + 1 })
      |> update_user(repo)
  end

  def update_user(changeset, repo \\ Repo) do
    {:ok, user} = repo.update(changeset)
    CLI.print "Congratulations #{user.name}, that brings your win total to #{user.wins}"
  end

  def update_save(changeset) do
    { :ok, _save } = Repo.update(changeset)
    CLI.print "Game saved"
  end

  def save_game(spaces, name, repo \\ Repo) do
    user = get_player(name)
    save = %Save{ user_id: user.id, spaces: spaces }
    cond do
      user.save ->
        Save.changeset(user.save, %{ spaces: spaces })
          |> update_save
      true ->
        { :ok, _save } = repo.insert save
        CLI.print "Game saved"
    end
  end

  def load_game(name, user \\ User, repo \\ Repo) do
    player = get_player(name, user, repo)
    player.save.spaces
  end
end
