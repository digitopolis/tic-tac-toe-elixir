defmodule TicTacToe.Game do
  alias TicTacToe.CLI
  alias TicTacToe.Player
  alias TicTacToe.Game
  alias TicTacToe.Board

  defstruct [:board, players: []]

  def get_players(input \\ CLI) do
    player1 = Player.new(input.get_player_name("X"), 1)
    player2 = Player.new(input.get_player_name("O"), 2)
    [player1, player2]
  end

  def current_player(game) do
    Enum.at(game.players, 0)
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

  def next_move(game) do
    Game.current_player(game)
      |> CLI.get_player_move
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

  def player_turn(game) do
    CLI.display_board(game.board)
    game = Game.next_move(game)
    CLI.display_board(game.board)
  end

end
