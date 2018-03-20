defmodule Citizen.Repo.Migrations.CreateContainers do
  use Ecto.Migration

  def change do
    create table(:containers) do
      add :label, :string

      timestamps()
    end

  end
end
