defmodule TicTacToe.CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.CLI

  test "console prints welcome message" do
    assert capture_io(fn -> CLI.welcome() end) =~ "Welcome"
  end
end
