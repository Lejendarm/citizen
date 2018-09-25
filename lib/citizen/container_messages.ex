defmodule Citizen.ContainerMessages do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "container_messages" do
    field(:parent_id, :id)
    field(:child_id, :id)

    timestamps()
  end

  @doc false
  def changeset(container_messages, attrs) do
    container_messages
    |> cast(attrs, [:parent_id, :child_id])
    |> validate_required([:parent_id, :child_id])
  end

  def retrieveContainerMessages(container_id) do
    {intVal, ""} = Integer.parse(container_id)

    from(
      cm in "container_messages",
      where: cm.parent_id == ^intVal,
      select: {cm.id, cm.parent_id, cm.child_id, cm.inserted_at, cm.updated_at}
    )
  end
end
