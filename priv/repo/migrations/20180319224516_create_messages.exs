defmodule Citizen.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :individual_id, references(:individuals, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:individual_id])
  end
end
