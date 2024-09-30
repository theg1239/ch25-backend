defmodule Ch25Backend.AnswersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ch25Backend.Answers` context.
  """

  @doc """
  Generate a answer.
  """
  def answer_fixture(attrs \\ %{}) do
    {:ok, answer} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        points_awarded: 42,
        submitted_at: ~U[2024-09-29 11:51:00Z]
      })
      |> Ch25Backend.Answers.create_answer()

    answer
  end
end
