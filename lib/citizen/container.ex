defmodule Citizen.Container do
  use Ecto.Schema
  import Ecto.Changeset


  schema "containers" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
