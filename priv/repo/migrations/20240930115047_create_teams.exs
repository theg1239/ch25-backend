defmodule Ch25Backend.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :join_code, :string
      add :leader_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:teams, [:join_code])
    create unique_index(:teams, [:name])
    create index(:teams, [:leader_id])
  end
end
