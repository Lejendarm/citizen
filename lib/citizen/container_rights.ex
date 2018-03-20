defmodule Citizen.ContainerRights do
  use Ecto.Schema
  import Ecto.Changeset


  schema "container_rights" do
    field :parent_id, :id
    field :child_id, :id

    timestamps()
  end

  @doc false
  def changeset(container_rights, attrs) do
    container_rights
    |> cast(attrs, [])
    |> validate_required([])
  end
end
