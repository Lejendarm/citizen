defmodule Citizen.Repo.Migrations.CreateRights do
  use Ecto.Migration

  def change do
    create table(:rights) do
      add :label, :string

      timestamps()
    end

  end
end
