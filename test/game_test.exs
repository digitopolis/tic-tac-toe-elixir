defmodule TicTacToe.GameTest do
  use ExUnit.Case
  alias TicTacToe.Game
  alias TicTacToe.Board

  test "game has a board" do
    game = %Game{board: Board.new(3)}
    assert length(game.board.spaces) == 9
  end

  test "game has two players" do
    game = %Game{}
    assert length(game.players) == 0

    updated_game = Game.add_players(game, MockInput)
    assert length(updated_game.players) == 2
  end

end
