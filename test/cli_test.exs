defmodule TicTacToe.CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.CLI

  test "console prints welcome message" do
    assert capture_io(fn -> CLI.welcome() end) =~ "Welcome"
  end

  test "gets player name" do
    assert capture_io([input: "Player One", capture_prompt: false], fn ->
      IO.write CLI.get_player_name("X", &MockInput.gets/1)
    end) == "Player One"
  end
end
