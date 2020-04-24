defmodule TicTacToe.DatabaseTest do
  use ExUnit.Case, async: true
  alias TicTacToe.Database
  alias TicTacToe.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "gets player from DB" do
    matt = Database.get_player("Matt")

    assert matt.name == "Matt"
  end

  test "inserts new player into DB" do
    player = Database.new_player("New player")
    from_db = Database.get_player(player.name)

    assert from_db.name == "New player"

    Repo.delete(from_db)
  end

  test "saves partial game" do
    board = ["X", nil, nil, "O", nil, nil, nil, nil, nil]
    Database.save_game(board, "Matt")
    matt = Database.get_player("Matt")

    assert Enum.at(matt.save.spaces, 0) == Enum.at(board, 0)
  end

  test "loads saved game board" do
    matt = Database.get_player("Matt")
    saved_board = Database.load_game("Matt")

    assert matt.save.spaces == saved_board
  end

  test "increments win total" do
    matt = Database.get_player("Matt")
    start = matt.wins
    Database.add_win("Matt")
    updated_matt = Database.get_player("Matt")

    assert updated_matt.wins == start + 1
  end
end
