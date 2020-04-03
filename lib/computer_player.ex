defmodule TicTacToe.ComputerPlayer do
  alias TicTacToe.Board
  alias TicTacToe.CLI

  def random_move(board) do
    move = Enum.random(1..Board.size(board))
    cond do
      Board.space_is_available(board.spaces, move) ->
        CLI.print "Computer selected #{move}"
        move
      true -> random_move(board)
    end
  end

end
