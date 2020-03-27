ExUnit.start()

defmodule MockInput do

  def gets(_prompt), do: "Player One"

  def get_player_name("X"), do: "First"
  def get_player_name("O"), do: "Second"

end
