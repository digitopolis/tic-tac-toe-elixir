defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "creates an empty board of given size" do
    %{spaces: spaces} = Board.new(3)

    assert length(spaces) == 9
    assert Enum.all?(spaces, fn s -> s == nil end)
  end

  test "updates board at given space" do
    board = Board.new(3)
    updated_board = Board.update_at(board, 4, "X")

    assert Enum.at(updated_board.spaces, 3) == "X"
  end

  test "validates space availability" do
    board = Board.new(3)
    assert Board.space_is_available(board.spaces, 5)

    updated_board = Board.update_at(board, 5, "O")
    refute Board.space_is_available(updated_board.spaces, 5)
  end
end
