defmodule Ch25Backend.CheckInsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ch25Backend.CheckIns` context.
  """

  @doc """
  Generate a check_in.
  """
  def check_in_fixture(attrs \\ %{}) do
    {:ok, check_in} =
      attrs
      |> Enum.into(%{
        checked_in_at: ~U[2024-09-29 11:51:00Z]
      })
      |> Ch25Backend.CheckIns.create_check_in()

    check_in
  end
end
