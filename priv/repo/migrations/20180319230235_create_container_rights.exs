defmodule Citizen.Repo.Migrations.CreateContainerRights do
  use Ecto.Migration

  def change do
    create table(:container_rights) do
      add :parent_id, references(:containers, on_delete: :nothing)
      add :child_id, references(:rights, on_delete: :nothing)

      timestamps()
    end

    create index(:container_rights, [:parent_id])
    create index(:container_rights, [:child_id])
  end
end
