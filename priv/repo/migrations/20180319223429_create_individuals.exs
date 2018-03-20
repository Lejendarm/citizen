defmodule Citizen.Repo.Migrations.CreateIndividuals do
  use Ecto.Migration

  def change do
    create table(:individuals) do
      add :name, :string

      timestamps()
    end

  end
end
