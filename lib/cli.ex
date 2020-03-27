defmodule TicTacToe.CLI do

  def welcome() do
    IO.puts "Welcome to Tic Tac Toe!"
  end

  def print(message) do
    IO.puts message
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
