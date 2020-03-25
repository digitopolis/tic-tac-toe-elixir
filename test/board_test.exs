defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "creates an empty board of given size" do
    %{spaces: spaces} = Board.new(3)

    assert length(spaces) == 9
    assert Enum.all?(spaces, fn s -> s == nil end)
  end
end
