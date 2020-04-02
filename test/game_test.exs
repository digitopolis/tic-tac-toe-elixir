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

  test "game alternates current player" do
    game = %Game{}
    new_game = Game.add_players(game, MockInput)
    assert Game.current_player(new_game).name == "First"

    game = Game.switch_players(new_game)
    assert Game.current_player(game).name == "Second"
  end

  test "game determines state" do
    new_game = %Game{board: Board.new(3)}
    result = Game.check_status(new_game)
    assert result.status == :in_play

    winning_game = %Game{board: %Board{ spaces: ["X", "X", "X", nil, nil, nil, nil, nil, nil], row_length: 3 }}
    result = Game.check_status(winning_game)
    assert result.status == :win

    draw_game = %Game{board: %Board{ spaces: ["X", "O", "X", "O", "O", "X", "X", "X", "O"], row_length: 3 }}
    result = Game.check_status(draw_game)
    assert result.status == :draw
  end
end
