defmodule Citizen.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field(:content, :string)
    field(:individual_id, :id)

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:individual_id, :content])
    |> validate_required([:individual_id, :content])
  end
end
