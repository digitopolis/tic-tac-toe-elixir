defmodule TicTacToe.ComputerPlayerTest do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.ComputerPlayer

  test "picks random available space" do
    board = %Board{ spaces: ["X", nil, "X", nil, "O", nil, nil, "O", "X"], row_length: 3 }
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
    assert Board.space_is_available(board.spaces, ComputerPlayer.random_move(board))
  end
end
