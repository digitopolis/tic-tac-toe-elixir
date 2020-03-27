defmodule TicTacToe.Player do
  alias TicTacToe.Player

  defstruct [:name, :marker]

  def new(name, 1), do: %Player{name: name, marker: "X"}
  def new(name, 2), do: %Player{name: name, marker: "O"}

end
