defmodule Ch25Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :role, :string, default: "participant"

    has_many :teams, Ch25Backend.Teams.Team, foreign_key: :leader_id
    has_many :check_ins, Ch25Backend.CheckIns.CheckIn
    has_many :answers, Ch25Backend.Answers.Answer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :role])
    |> validate_required([:email, :name, :role])
    |> unique_constraint(:email)
    |> validate_inclusion(:role, ["participant", "volunteer"])
  end
end
