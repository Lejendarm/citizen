defmodule Citizen.Repo.Migrations.CreateInterferences do
  use Ecto.Migration

  def change do
    create table(:interferences) do
      add :container_id, references(:containers, on_delete: :nothing)
      add :container_right_id, references(:container_rights, on_delete: :nothing)

      timestamps()
    end

    create index(:interferences, [:container_id])
    create index(:interferences, [:container_right_id])
  end
end
