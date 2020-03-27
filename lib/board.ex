defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct [:spaces]

  def new(size) do
    %Board{spaces: List.duplicate(nil, size * size)}
  end
end
