defmodule TicTacToe.Player do
  alias TicTacToe.Player

  defstruct [:name, :marker]

  def new(1), do: %Player{marker: "X"}
  def new(2), do: %Player{marker: "O"}

end
