defmodule TicTacToe.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :wins, :integer
  end

end
