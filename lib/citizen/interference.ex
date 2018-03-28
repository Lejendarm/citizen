defmodule Citizen.Interference do
  use Ecto.Schema
  import Ecto.Changeset


  schema "interferences" do
    field :container_id, :id
    field :container_right_id, :id

    timestamps()
  end

  @doc false
  def changeset(interference, attrs) do
    interference
    |> cast(attrs, [])
    |> validate_required([])
  end
end
