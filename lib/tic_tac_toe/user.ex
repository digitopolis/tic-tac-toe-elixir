defmodule TicTacToe.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :wins, :integer
  end

  def changeset(user, params \\ %{}) do
    user
      |> Ecto.Changeset.cast(params, [:wins])
  end

end
