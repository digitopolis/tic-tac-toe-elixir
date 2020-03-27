defmodule TicTacToe.CLI do
  alias TicTacToe.Board
  alias TicTacToe.CLI

  def welcome() do
    IO.puts "Welcome to Tic Tac Toe!"
  end

  def print(message) do
    IO.puts message
  end

  def get_display_list(spaces) do
    for x <- [1, 2, 3, 4, 5, 6, 7, 8, 9] do
      if Board.space_is_available(spaces, x) do
        x
      else
        Enum.at(spaces, x - 1)
      end
    end
  end

  def display_board(spaces) do
    display_spaces = CLI.get_display_list(spaces)
    IO.write """
       #{Enum.at(display_spaces, 0)}  |  #{Enum.at(display_spaces, 1)}  |  #{Enum.at(display_spaces, 2)}
      ----+-----+----
       #{Enum.at(display_spaces, 3)}  |  #{Enum.at(display_spaces, 4)}  |  #{Enum.at(display_spaces, 5)}
      ----+-----+----
       #{Enum.at(display_spaces, 6)}  |  #{Enum.at(display_spaces, 7)}  |  #{Enum.at(display_spaces, 8)}
      """
  end

  def get_player_name(marker, gets \\ &IO.gets/1) do
    gets.("Player #{marker}, please enter your name:\n")
      |> String.trim()
  end

  def get_player_move(name, gets \\ &IO.gets/1) do
    gets.("#{name}, please select a space:\n")
      |> String.trim()
      |> String.to_integer()
  end
end
