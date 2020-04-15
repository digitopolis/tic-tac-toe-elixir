ExUnit.start()

defmodule MockInput do

  def gets(_prompt), do: "Player One"

  def get_player_name("X"), do: "First"
  def get_player_name("O"), do: "Second"

  def gets_move(_prompt), do: "5"

  def get_number_of_players do
    2
  end

end

defmodule TicTacToe.MockUser do
  def changeset(user, _params \\ %{}) do
    %{user | wins: user.wins + 1}
  end
end

defmodule TicTacToe.MockRepo do

  @db [
    %TicTacToe.User{
      id: 4,
      name: "Beezie",
      save: nil,
      wins: 0
    },
    %TicTacToe.User{
      id: 6,
      name: "Computer",
      save: nil,
      wins: 0
    },
    %TicTacToe.User{
      id: 3,
      name: "Jennie",
      save: nil,
      wins: 2
    },
    %TicTacToe.User{
      id: 2,
      name: "Matty",
      save: ["X", nil, "O", nil, "X", nil, nil, nil, nil],
      wins: 6
    },
    %TicTacToe.User{
      id: 8,
      name: "First",
      save: nil,
      wins: 0
    },
    %TicTacToe.User{
      id: 9,
      name: "Second",
      save: nil,
      wins: 0
    },
    %TicTacToe.User{
      id: 5,
      name: "Bins",
      save: nil,
      wins: 1
    },
    %TicTacToe.User{
      id: 1,
      name: "Matt",
      save: nil,
      wins: 3
    },
    %TicTacToe.User{
      id: 13,
      name: "n00b",
      save: nil,
      wins: 1
    }
  ]

  def get_by(_user, [ name: name ]) do
    Enum.find(@db, fn x -> x.name == name end)
  end

  def preload(user, :save) do
    saved_game = ["X", nil, "O", nil, "X", nil, nil, nil, nil]
    %{user | save: saved_game}
  end

  def update_db(user) do
    [ user | @db ]
  end

  def insert(user) do
    { :ok, user }
  end

  def update(user) do
    { :ok, user }
  end

end
