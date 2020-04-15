defmodule TicTacToe.MockDatabaseTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Database
  alias TicTacToe.MockRepo
  alias TicTacToe.MockUser
  alias TicTacToe.User

  test "get player from mock db" do
    matt = Database.get_player("Matt", User, MockRepo)

    assert matt.name == "Matt"
  end

  test "insert player in mock db" do
    player = Database.new_player("New player", MockRepo)
    updated_db = MockRepo.update_db(player)

    new_player = Enum.find(updated_db, fn x -> x.name == player.name end)
    assert new_player.name == "New player"
  end

  test "saves game board in mock db" do
    board = ["X", nil, nil, "O", nil, nil, nil, nil, nil]

    assert capture_io(fn ->
      Database.save_game(board, "Matt", MockRepo)
    end) =~ "Game saved"
  end

  test "loads saved game from mock db" do
    matty = Database.get_player("Matty", User, MockRepo)

    assert matty.save == ["X", nil, "O", nil, "X", nil, nil, nil, nil]
  end

  test "updates player wins in mock db" do
    matt = Database.get_player("Matt", User, MockRepo)
    assert capture_io(fn ->
      Database.add_win(matt.name, MockUser, MockRepo)
    end) =~ "that brings your win total to #{matt.wins + 1}"
  end
end
