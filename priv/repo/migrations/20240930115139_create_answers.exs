defmodule Ch25Backend.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :answer, :string
      add :points_awarded, :integer
      add :submitted_at, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:answers, [:user_id])
    create index(:answers, [:question_id])
  end
end
