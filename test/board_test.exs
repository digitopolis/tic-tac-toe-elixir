defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "creates an empty board of given size" do
    %{spaces: spaces} = Board.new(3)

    assert length(spaces) == 9
    assert Enum.all?(spaces, fn s -> s == nil end)
  end

  test "updates board at given space" do
    %{spaces: spaces} = Board.new(3)
    updated_spaces = Board.update_at(spaces, 4, "X")

    assert Enum.at(updated_spaces, 3) == "X"
  end

  test "validates space availability" do
    %{spaces: spaces} = Board.new(3)
    assert Board.space_is_available(spaces, 5)

    updated_spaces = Board.update_at(spaces, 5, "O")
    refute Board.space_is_available(updated_spaces, 5)
  end
end
