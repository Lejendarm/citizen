defmodule Citizen.Repo.Migrations.CreateContainerMessages do
  use Ecto.Migration

  def change do
    create table(:container_messages) do
      add :parent_id, references(:containers, on_delete: :nothing)
      add :child_id, references(:messages, on_delete: :nothing)

      timestamps()
    end

    create index(:container_messages, [:parent_id])
    create index(:container_messages, [:child_id])
  end
end
