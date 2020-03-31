defmodule TicTacToe.Board do
  alias TicTacToe.Board
  alias TicTacToe.CLI

  defstruct [:spaces]

  def new(size) do
    %Board{spaces: List.duplicate(nil, size * size)}
  end

  def size(board) do
    length(board.spaces)
  end

  def validate_move(move, board) do
    cond do
      move <= 0 || move > Board.size(board) ->
        CLI.print "Please select an available space between 1-#{Board.size(board)}"
        -1
      Board.space_is_available(board.spaces, move) -> move
    end
  end

  def update_at(board, space, marker) do
    updated_spaces = List.update_at(board.spaces, space - 1, &(&1 = marker))
    Map.replace!(board, :spaces, updated_spaces)
  end

  def space_is_available(spaces_list, space) do
    !Enum.at(spaces_list, space - 1)
  end

  def get_display_list(board) do
    for x <- [1, 2, 3, 4, 5, 6, 7, 8, 9] do
      if Board.space_is_available(board.spaces, x) do
        x
      else
        Enum.at(board.spaces, x - 1)
      end
    end
  end
end
