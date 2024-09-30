defmodule Ch25Backend.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :title, :string
      add :description, :text
      add :qr_code, :string
      add :answer_type, :string
      add :points, :integer
      add :phase, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
