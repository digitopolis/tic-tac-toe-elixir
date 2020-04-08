defmodule TicTacToe.Player do
  alias TicTacToe.Player
  alias TicTacToe.Database

  defstruct [:name, :marker, :wins, computer: false]

  def new(name, 1), do: %Player{name: name, marker: "X"}
  def new(name, 2), do: %Player{name: name, marker: "O"}
  def new(name, 2, true), do: %Player{name: name, marker: "O", computer: true}

  def player_list(1, input) do
    [ Player.new(input.get_player_name("X"), 1), Player.new("Computer", 2, true) ]
  end

  def player_list(2, input) do
    [ Player.new(input.get_player_name("X"), 1), Player.new(input.get_player_name("O"), 2) ]
  end

  def login_players(players) do
    Enum.map(players, fn player -> %Player{ player | wins: Player.get_player_wins(player.name)} end)
  end

  def get_player_wins(name) do
    player = Database.get_player(name)
    cond do
      player -> player.wins
      true -> Database.new_player(name).wins
    end
  end

end
