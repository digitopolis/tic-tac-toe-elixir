defmodule TicTacToe.CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.CLI
  alias TicTacToe.Player

  test "console prints welcome message" do
    assert capture_io(fn -> CLI.welcome() end) =~ "Welcome"
  end

  test "gets player name" do
    assert capture_io([input: "Player One", capture_prompt: false], fn ->
      IO.write CLI.get_player_name("X", &MockInput.gets/1)
    end) == "Player One"
  end

  test "gets player move" do
    assert capture_io([input: "5", capture_prompt: false], fn ->
      IO.write CLI.get_player_move(%Player{ name: "Matt" }, &MockInput.gets_move/1)
    end) == "5"
  end
end
