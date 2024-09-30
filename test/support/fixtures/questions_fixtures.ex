defmodule Ch25Backend.QuestionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ch25Backend.Questions` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        answer_type: "some answer_type",
        description: "some description",
        phase: 42,
        points: 42,
        qr_code: "some qr_code",
        title: "some title"
      })
      |> Ch25Backend.Questions.create_question()

    question
  end
end
