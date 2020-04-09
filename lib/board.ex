defmodule TicTacToe.Board do
  alias TicTacToe.Board
  alias TicTacToe.CLI

  defstruct [:spaces, :row_length]

  def new(size) do
    %Board{ spaces: List.duplicate(nil, size * size), row_length: size }
  end

  def size(board) do
    length(board.spaces)
  end

  def validate_move(:save, _board) do
    :save
  end
  def validate_move(move, board) do
    cond do
      move <= 0 || move > Board.size(board) || !Board.space_is_available(board.spaces, move) ->
        CLI.print "Please select an available space between 1-#{Board.size(board)}"
        -1
      Board.space_is_available(board.spaces, move) -> move
    end
  end

  def update_at(board, space, marker) do
    updated_spaces = List.update_at(board.spaces, space - 1, &(&1 = marker))
    Map.replace!(board, :spaces, updated_spaces)
  end

  def space_is_available(spaces_list, space) do
    !Enum.at(spaces_list, space - 1)
  end

  def is_full?(board) do
    Enum.all?(board.spaces)
  end

  def has_winning_combo?(board) do
    rows = Board.get_rows(board)
    (rows ++
      TicTacToe.Board.get_columns(rows) ++
      [TicTacToe.Board.get_down_diagonal(rows)] ++
      [TicTacToe.Board.get_up_diagonal(rows)])
        |> Enum.any?(fn line -> Enum.all?(line, fn x -> x == Enum.at(line, 0) end) end)
  end

  def get_display_list(board) do
    for x <- [1, 2, 3, 4, 5, 6, 7, 8, 9] do
      if Board.space_is_available(board.spaces, x) do
        x
      else
        Enum.at(board.spaces, x - 1)
      end
    end
  end

  def get_rows(board) do
    Board.get_display_list(board)
      |> Enum.chunk_every(board.row_length)
  end

  def get_columns(rows) do
    rows
      |> Enum.zip
      |> Enum.map(&Tuple.to_list/1)
  end

  def get_down_diagonal(rows) do
    rows
      |> Enum.with_index
      |> Enum.map(fn { row, index } -> Enum.at(row, index) end)
  end
  def get_up_diagonal(rows) do
    rows
      |> Enum.reverse
      |> Board.get_down_diagonal
  end
end
