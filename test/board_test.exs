defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "creates an empty board of given size" do
    %{spaces: spaces} = Board.new(3)

    assert length(spaces) == 9
    assert Enum.all?(spaces, fn s -> s == nil end)
  end

  test "updates board at given space" do
    board = Board.new(3)
    updated_board = Board.update_at(board, 4, "X")

    assert Enum.at(updated_board.spaces, 3) == "X"
  end

  test "validates space availability" do
    board = Board.new(3)
    assert Board.space_is_available(board.spaces, 5)

    updated_board = Board.update_at(board, 5, "O")
    refute Board.space_is_available(updated_board.spaces, 5)
  end

  test "gets list of rows" do
    board = Board.new(3)
    first_row = [1, 2, 3]
    third_row = [7, 8 ,9]

    rows_list = Board.get_rows(board)
    assert Enum.at(rows_list, 0) == first_row
    assert Enum.at(rows_list, 2) == third_row
  end

  test "gets list of columns" do
    rows = Board.get_rows(Board.new(3))
    first_column = [1, 4, 7]
    third_column = [3, 6 ,9]

    columns_list = Board.get_columns(rows)
    assert Enum.at(columns_list, 0) == first_column
    assert Enum.at(columns_list, 2) == third_column
  end

  test "gets down diagonal" do
    rows = Board.get_rows(Board.new(3))
    diagonal = [1, 5, 9]

    down_diagonal = Board.get_down_diagonal(rows)
    assert diagonal == down_diagonal
  end

  test "gets up diagonal" do
    rows = Board.get_rows(Board.new(3))
    diagonal = [7, 5, 3]

    up_diagonal = Board.get_up_diagonal(rows)
    assert diagonal == up_diagonal
  end

  test "determines if board is full" do
    empty_board = Board.new(3)
    refute Board.is_full?(empty_board)

    full_board = %Board{ spaces: ["X", "O", "X", "X", "O", "X", "X", "O", "X"], row_length: 3 }
    assert Board.is_full?(full_board)

    partial_board = %Board{ spaces: ["X", nil, "X", nil, "O", nil, nil, "O", "X"], row_length: 3 }
    refute Board.is_full?(partial_board)
  end

  test "finds winning combination" do
    winning_board = %Board{ spaces: ["X", "X", "X", nil, nil, nil, nil, nil, nil], row_length: 3 }
    assert Board.has_winning_combo?(winning_board)

    partial_board = %Board{ spaces: ["X", nil, "X", nil, "O", nil, nil, "O", "X"], row_length: 3 }
    refute Board.has_winning_combo?(partial_board)
  end
end
