defmodule Ch25Backend.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :description, :string
    field :title, :string
    field :phase, :integer
    field :qr_code, :string
    field :answer_type, :string
    field :points, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :description, :qr_code, :answer_type, :points, :phase])
    |> validate_required([:title, :description, :qr_code, :answer_type, :points, :phase])
  end
end
