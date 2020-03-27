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

  def add_players(game, input \\ CLI) do
    Map.replace!(game, :players, Game.get_players(input))
  end

  def make_move(game, move, input \\ CLI) do
    [ current_player | _tail ] = game.players
    cond do
      !Board.space_is_available(game.board.spaces, move) ->
        input.print "That space isn't available, please choose an open space between 1 and #{length(game.board.spaces)}"
        new_move = input.get_player_move(current_player.name)
        make_move(game, new_move, input)
      Board.space_is_available(game.board.spaces, move) ->
        new_board = Board.update_at(game.board.spaces, move, current_player.marker)
        update_in(game, [Access.key(:board), Access.key(:spaces)], &(&1 = new_board))
    end
  end

end
