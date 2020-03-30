defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct [:spaces]

  def new(size) do
    %Board{spaces: List.duplicate(nil, size * size)}
  end

  def update_at(spaces_list, space, marker) do
    List.update_at(spaces_list, space - 1, &(&1 = marker))
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
