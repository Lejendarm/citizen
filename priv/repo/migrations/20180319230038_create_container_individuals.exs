defmodule Citizen.Repo.Migrations.CreateContainerIndividuals do
  use Ecto.Migration

  def change do
    create table(:container_individuals) do
      add :parent_id, references(:containers, on_delete: :nothing)
      add :child_id, references(:individuals, on_delete: :nothing)

      timestamps()
    end

    create index(:container_individuals, [:parent_id])
    create index(:container_individuals, [:child_id])
  end
end
