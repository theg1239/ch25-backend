defmodule Ch25Backend.Answers.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :answer, :string
    field :points_awarded, :integer
    field :submitted_at, :utc_datetime

    belongs_to :user, Ch25Backend.Accounts.User
    belongs_to :question, Ch25Backend.Questions.Question

    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:answer, :points_awarded, :submitted_at, :user_id, :question_id])
    |> validate_required([:answer, :points_awarded, :submitted_at, :user_id, :question_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:question_id)
  end
end
