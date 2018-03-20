defmodule Citizen.Individual do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "individuals" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(individual, attrs) do
    individual
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
