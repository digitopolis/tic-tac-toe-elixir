defmodule TicTacToe.Game do
  alias TicTacToe.CLI
  alias TicTacToe.Player
  alias TicTacToe.Game
  alias TicTacToe.Board

  defstruct [:board, players: [], status: :in_play]

  def get_players(input \\ CLI) do
    input.get_number_of_players()
      |> Player.player_list(input)
  end

  def current_player(game) do
    Enum.at(game.players, 0)
  end

  def switch_players(%Game{status: status} = game) when status == :win do
    game
  end
  def switch_players(game) do
    update_in(game, [Access.key(:players)], &(Enum.reverse(&1)))
  end

  def add_players(game, input \\ CLI) do
    Map.replace!(game, :players, Game.get_players(input))
  end

  def add_board(game) do
    Map.replace!(game, :board, Board.new(3))
  end

  def update(board, game) do
    Map.replace!(game, :board, board)
  end

  def show_board(game) do
    CLI.display_board(game.board)
    game
  end

  def next_move(game) do
    Game.current_player(game)
      |> CLI.get_player_move(game.board)
      |> Board.validate_move(game.board)
      |> Game.make_move(game)
  end

  def make_move(-1, game) do
    Game.next_move(game)
  end

  def make_move(move, game) do
    { current_player, board } = { Game.current_player(game), game.board }
    Board.update_at(board, move, current_player.marker)
      |> Game.update(game)
  end

  def check_status(%Game{board: board} = game) do
    status = cond do
      Board.has_winning_combo?(board) -> :win
      Board.is_full?(board) -> :draw
      true -> :in_play
    end
    Map.replace!(game, :status, status)
  end

  def player_turn(game) do
    game
      |> Game.show_board
      |> Game.next_move
  end

  def play(%Game{status: status} = game) when status == :win do
    player = Game.current_player(game)
    CLI.print "#{player.name} wins!"
    Game.end_game()
  end

  def play(%Game{status: status}) when status == :draw do
    CLI.print "Game over - it's a draw."
    Game.end_game()
  end

  def play(game) do
    game
      |> Game.player_turn
      |> Game.check_status
      |> Game.switch_players
      |> Game.play
  end

  def end_game("Y"), do: TicTacToe.play()
  def end_game("N"), do: CLI.print "Thanks for playing!"
  def end_game() do
    CLI.get_end_game_selection()
      |> Game.end_game
  end

end
