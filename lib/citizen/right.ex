defmodule Citizen.Right do
  use Ecto.Schema
  import Ecto.Changeset


  schema "rights" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(right, attrs) do
    right
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
