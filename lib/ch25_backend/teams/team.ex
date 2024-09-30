defmodule Ch25Backend.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :join_code, :string
    belongs_to :leader, Ch25Backend.Accounts.User

    has_many :members, Ch25Backend.Accounts.User, foreign_key: :team_id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :join_code, :leader_id])
    |> validate_required([:name, :join_code, :leader_id])
    |> validate_length(:name, max: 28)
    |> validate_length(:join_code, is: 5)
    |> unique_constraint(:name)
    |> unique_constraint(:join_code)
    |> foreign_key_constraint(:leader_id)
  end
end
