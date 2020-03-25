defmodule TicTacToe.GameTest do
  use ExUnit.Case
  alias TicTacToe.Game
  alias TicTacToe.Board

  test "game has a board" do
    game = %Game{board: Board.new(3)}

    assert length(game.board.spaces) == 9
  end

end
