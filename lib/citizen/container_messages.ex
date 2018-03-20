defmodule Citizen.ContainerMessages do
  use Ecto.Schema
  import Ecto.Changeset


  schema "container_messages" do
    field :parent_id, :id
    field :child_id, :id

    timestamps()
  end

  @doc false
  def changeset(container_messages, attrs) do
    container_messages
    |> cast(attrs, [])
    |> validate_required([])
  end
end
