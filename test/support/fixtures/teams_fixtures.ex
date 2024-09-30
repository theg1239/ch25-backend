defmodule Ch25Backend.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ch25Backend.Teams` context.
  """

  @doc """
  Generate a unique team join_code.
  """
  def unique_team_join_code, do: "some join_code#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique team name.
  """
  def unique_team_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        join_code: unique_team_join_code(),
        name: unique_team_name()
      })
      |> Ch25Backend.Teams.create_team()

    team
  end
end
