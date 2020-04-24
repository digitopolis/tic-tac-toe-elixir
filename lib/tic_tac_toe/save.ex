defmodule TicTacToe.Save do
  use Ecto.Schema

  schema "saves" do
    field :spaces, {:array, :string}
    belongs_to :user, TicTacToe.User
  end

  def changeset(save, params \\ %{}) do
    save
      |> Ecto.Changeset.cast(params, [:spaces])
  end
end
