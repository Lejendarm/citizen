defmodule Citizen.ContainerIndividual do
  use Ecto.Schema
  import Ecto.Changeset


  schema "container_individuals" do
    field :parent_id, :id
    field :child_id, :id

    timestamps()
  end

  @doc false
  def changeset(container_individual, attrs) do
    container_individual
    |> cast(attrs, [])
    |> validate_required([])
  end
end
