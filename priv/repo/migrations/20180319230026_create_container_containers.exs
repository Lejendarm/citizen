defmodule Citizen.Repo.Migrations.CreateContainerContainers do
  use Ecto.Migration

  def change do
    create table(:container_containers) do
      add :parent_id, references(:containers, on_delete: :nothing)
      add :child_id, references(:containers, on_delete: :nothing)

      timestamps()
    end

    create index(:container_containers, [:parent_id])
    create index(:container_containers, [:child_id])
  end
end
