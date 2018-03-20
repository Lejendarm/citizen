defmodule Citizen.ContainerContainer do
  use Ecto.Schema
  import Ecto.Changeset


  schema "container_containers" do
    field :parent_id, :id
    field :child_id, :id

    timestamps()
  end

  @doc false
  def changeset(container_container, attrs) do
    container_container
    |> cast(attrs, [])
    |> validate_required([])
  end
end
