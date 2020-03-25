defmodule TicTacToe.PlayerTest do
  use ExUnit.Case
  alias TicTacToe.Player

  test "player has a name" do
    player1 = %Player{name: "Matt"}

    assert player1.name == "Matt"
  end

  test "player has a marker" do
    player1 = Player.new(1)
    player2 = Player.new(2)

    assert player1.marker == "X"
    assert player2.marker == "O"
  end

end
