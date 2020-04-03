defmodule TicTacToe.CLI do
  alias TicTacToe.Board
  alias TicTacToe.Player
  alias TicTacToe.ComputerPlayer

  def welcome() do
    IO.puts "Welcome to Tic Tac Toe!"
  end

  def print(message) do
    IO.puts message
  end

  def display_board(board) do
    display_spaces = Board.get_display_list(board)
    IO.write """

       #{Enum.at(display_spaces, 0)}  |  #{Enum.at(display_spaces, 1)}  |  #{Enum.at(display_spaces, 2)}
      ----+-----+----
       #{Enum.at(display_spaces, 3)}  |  #{Enum.at(display_spaces, 4)}  |  #{Enum.at(display_spaces, 5)}
      ----+-----+----
       #{Enum.at(display_spaces, 6)}  |  #{Enum.at(display_spaces, 7)}  |  #{Enum.at(display_spaces, 8)}

      """
  end

  def get_number_of_players() do
    IO.gets("Please enter the number of players (1 or 2)")
      |> String.trim
      |> String.to_integer
  end

  def get_player_name(marker, gets \\ &IO.gets/1) do
    gets.("Player #{marker}, please enter your name:\n")
      |> String.trim()
  end

  def get_player_move(%Player{computer: computer}, board, _gets) when computer == true do
    ComputerPlayer.random_move(board)
  end

  def get_player_move(player, _board, gets \\ &IO.gets/1) do
    gets.("#{player.name}, please select a space:\n")
      |> String.trim()
      |> String.to_integer()
  end

  def get_end_game_selection() do
    IO.gets("Would you like to play again? Y/N:\n")
      |> String.trim()
      |> String.upcase()
  end
end
