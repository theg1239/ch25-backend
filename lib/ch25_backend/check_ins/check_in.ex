defmodule Ch25Backend.CheckIns.CheckIn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "check_ins" do
    field :checked_in_at, :utc_datetime

    belongs_to :user, Ch25Backend.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(check_in, attrs) do
    check_in
    |> cast(attrs, [:checked_in_at, :user_id])
    |> validate_required([:checked_in_at, :user_id])
    |> foreign_key_constraint(:user_id)
  end
end
