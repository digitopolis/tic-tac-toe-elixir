defmodule TicTacToe.Player do
  alias TicTacToe.Player

  defstruct [:name, :marker, computer: false]

  def new(name, 1), do: %Player{name: name, marker: "X"}
  def new(name, 2), do: %Player{name: name, marker: "O"}
  def new(name, 2, true), do: %Player{name: name, marker: "O", computer: true}

  def player_list(1, input) do
    [ Player.new(input.get_player_name("X"), 1), Player.new("Computer", 2, true) ]
  end

  def player_list(2, input) do
    [ Player.new(input.get_player_name("X"), 1), Player.new(input.get_player_name("O"), 2) ]
  end

end
