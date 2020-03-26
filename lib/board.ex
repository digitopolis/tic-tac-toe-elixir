defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct [:spaces]

  def new(size) do
    %Board{spaces: List.duplicate(nil, size * size)}
  end

  def update_at(spaces_list, space, marker) do
    List.update_at(spaces_list, space - 1, &(&1 = marker))
  end
end
